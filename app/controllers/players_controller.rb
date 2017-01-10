class PlayersController < ApplicationController
  include GameCode
  before_action :logged_in_user, only: [:new, :create]

  def new
    @game = Game.find(params[:id])
    @player = @game.players.new
  end

  def create
    @game = Game.find(params[:game_id])
    @user = current_user
    if @game.active || @game.players.find_by(user_id: @user.id)
      flash[:danger] = "You cannot join this game"
      return redirect_to game_url(id: @game.id)
    end
    @player = @user.players.new(game_id: @game.id, icon: params[:player][:icon])
    if @player.save
      if players_met?(@game)
        @game.update!(active: true, turn_index: 1)
        start_game(@game)
      end
      flash[:success] = "Game joined sucessfully."
      redirect_to game_url(id: @game.id)
    else
      render 'players/new'
    end
  end

  private

  def players_met?(game)
    game.players.count >= game.num_of_players
  end

end
