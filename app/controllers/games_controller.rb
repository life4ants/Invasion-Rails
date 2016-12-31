class GamesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_player, only: [:destroy, :edit, :update]
  before_action :game_active, only: [:play]

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
    @owners = @game.territory_owners.first
    @reserves = @game.territory_reserves.first
    @current_player = current_player(@game)
    players = @game.player_ids
    players_array = {}
    players.each do |n|
      players_array[n] = Player.find(n).icon
    end
    gon.watch.push(
    user: @current_user.attributes.slice("id", "name"),
    owners: @owners,
    reserves: @reserves,
    game: @game.id,
    players: players_array)
  end

  def mess
    data = params[:message]
    Pusher.trigger('notifications', 'all', { message: data })
    render nothing: true, status: :ok
  end

  def increment_reserves()
    game = Game.find(params[:game])
    index = params[:index]
    reserves = game.territory_reserves.first
    value = reserves[:"terr#{index}Reserves"]
    reserves.update("terr#{index}Reserves": value + 1)
    gon.watch.reserves = reserves
    render nothing: true, status: :ok
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
    players = game.player_ids
    Player.find(players[game.turn_index])
  end
end
