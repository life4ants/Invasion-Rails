class GamesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_player, only: [:destroy, :edit, :update]
  before_action :game_active, only: [:play]

  def new
    @game = Game.new(num_of_players: 3)
    @player = Player.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @user = current_user
    @game = Game.new(game_params)
    time = Time.now.to_formatted_s(:number)
    @game.nick_name = "#{@user.name}#{time}" if @game.nick_name.empty?
    if @game.save
      @game.update(random_select: true, wins_tie: false, num_of_cards: 15)
      @game.territory_owners.create!
      @game.territory_reserves.create!
      @game.players.create!(user_id: @user.id, admin: true, icon: params[:icon])
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
end
