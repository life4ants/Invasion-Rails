class GamesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_player, only: [:destroy, :edit, :update]
  before_action :game_active, only: [:play]

  include GameCode

  def new
    @game = Game.new(num_of_players: 3)
  end

  def show
    @game = Game.find(params[:id])
    @players = @game.players.includes(:user)
  end

  def create    #TODO: error handling if game saves but player doesn't
    @user = current_user
    @game = Game.new(game_params)
    time = Time.now.to_formatted_s(:number)
    @game.nick_name = "#{@user.name}#{time}" if @game.nick_name.empty?
    if @game.save
      @game.update(random_select: true, wins_tie: false, num_of_cards: 15)
      @game.players.create!(user_id: @user.id, admin: true, icon: params[:game][:player][:icon])
      flash[:info] = "Game created sucessfully."
      redirect_to games_url
    else
      render 'new'
    end
  end

  def index
    @games = Game.all
  end

  def destroy
    Game.find(params[:id]).destroy
    flash[:success] = "Game deleted"
    redirect_to games_url
  end

  def update
    if @game.update_attributes(game_params)
      flash[:success] = "Game updated"
      redirect_to @game
    else
      render 'edit'
    end
  end

  def edit
  end

  def play
    @game = Game.find(params[:id])
    gon = fetch_game_data(@game)
    @current_player = current_player(@game)
    @players = @game.players.order(:turn_order)
    @messages = @game.messages
  end

  def mess
    data = params[:message]
    user = User.find(params[:user])
    Message.create(game_id: 1, sender: user.name, content: data)
    #ActionCable.server.broadcast "notifications_channel", content: data
    head :ok
  end

  def refresh_data
    territory_data = get_new_game_data(params)
    render json: territory_data
  end

  def initial_troops
    return_data = validate_initial_troops(params)
    render json: return_data
  end

  def game_header
    @game = Game.find(params[:id])
    @current_player = current_player(@game)
    render partial: 'layouts/game_header'
  end

  def sidebar
    @game = Game.find(params[:id])
    @players = @game.players.order(:turn_order)
    @messages = @game.messages
    render partial: 'games/sidebar'
  end

  private

  def game_params
    params.require(:game).permit(:num_of_players,
            :nick_name, :random_select, :wins_tie, :num_of_cards)
  end

  def admin_player
    @game = Game.find(params[:id])
    @user = @game.players.where(admin:true).first.user
    unless @user == current_user
      flash[:danger] = "Action not allowed!"
      redirect_to(message_url)
    end
  end

  def game_active
    @game = Game.find(params[:id])
    unless @game.active
      flash[:danger] = "This game is not active!"
      redirect_to root_path
    end
  end

  def current_player(game)
    game.players.find_by(turn_order: game.turn_index)
  end

  def fetch_game_data(game)
    current_player = current_player(game)
    players = game.players.order(:turn_order)
    player_terr_counts = []
    players.each do |player|
      player_terr_counts.push(player.game_territories.count)
    end
    player_icons = {}
    game.player_ids.each do |n|
      player_icons[n] = Player.find(n).icon
    end
    owners = game.game_territories.map(&:player_id)
    troops = game.game_territories.map(&:troops)
    territory_data = {update_time: Time.now}
    90.times do |n|
      territory_data[n+1] = {owner: owners[n], troops: troops[n]}
    end
    gon.push(
      user: @current_user.attributes.slice("id", "name"),
      current_player: current_player,
      user_player: @current_user.players.find_by(game_id: game.id),
      game: game,
      territory_data: territory_data,
      player_icons: player_icons,
      player_terr_counts: player_terr_counts)
    gon
  end
end
