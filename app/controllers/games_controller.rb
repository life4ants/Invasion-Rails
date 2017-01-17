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
    gon.push(fetch_game_data(@game))
    @current_player = @game.current_player
    @players = @game.players.order(:turn_order)
    @messages = @game.messages
  end

  def initial_troops
    pam = JSON.parse(params[:this])
    game = Game.find(pam["game"])
    if (pam["player"] == game.turn_index)
      data = pam["data"]
      player = game.current_player
      total = 0
      data.each do |n|
        total += n[1]
      end
      if total == player.temp_reserves*2
        total = data.delete("total")
        player_territories = player.game_territory_ids
        if validate_territories(data, player_territories)
          return_data = update_initial_troops(data, game, total)
          render json: return_data
        else
          render json: {success: false, reason: "territories don't match player"}
        end
      else
        render json: {success: false, reason: "wrong number of troops assigned"}
      end
    else
      render json: {success: false, reason: "wrong player"}
    end
  end

  def refresh_gon
    game = Game.find(params[:game])
    data = fetch_game_data(game)
    render json: data
  end

  def mess
    pam = JSON.parse(params[:this])
    game = pam["game"]
    ActionCable.server.broadcast "Game_#{game}",  type: "initialTroops",
                                 terr_data: pam["data"]
    head :ok
  end

  #def game_header
  #  @game = Game.find(params[:id])
  #  @current_player = current_player(@game)
  #  render partial: 'layouts/game_header'
  #end

  #def sidebar
  #  @game = Game.find(params[:id])
  #  @players = @game.players.order(:turn_order)
  #  @messages = @game.messages
  #  render partial: 'games/sidebar'
  #end

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
      flash[:danger] = "That game is not active!"
      redirect_to root_path
    end
  end

  def fetch_game_data(game)
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
    game_data = {
      current_player: game.current_player.public_attr,
      user_player: Player.find_by(game_id: game.id, user_id: current_user.id),
      game: game,
      territory_data: territory_data,
      player_terr_counts: player_terr_counts,
      player_icons: player_icons,
      user: current_user.public_attr}
  end

  def validate_territories(test, array)
    test.each do |n|
      return false unless array.include?(n[0].to_i)
    end
    return true
  end
end
