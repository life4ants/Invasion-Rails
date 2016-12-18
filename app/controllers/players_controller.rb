class PlayersController < ApplicationController
  include GameCode
  before_action :logged_in_user, only: [:new, :create]

  def new
    @game = Game.find(params[:id])
    @player = @game.players.new
  end

  def create
    @game = Game.find(params[:game_id])
    if @game.active
      flash[:danger] = "You cannot join this game"
      return redirect_to game_url
    end
    @user = current_user
    @player = @user.players.new(game_id: @game.id, icon: params[:player][:icon])
    #logger.debug("icon: #{params[:player[:icon]]}")
    if @player.save
      if players_met?(@game)
        @game.active = true
        @game.save
        start_game(@game)
      end
       flash[:success] = "Game joined sucessfully."
       redirect_to game_url
    else
      render 'players/new'
    end
  end

  private

  def players_met?(game)
    game.players.count == game.num_of_players
  end

end
