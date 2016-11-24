class GamesController < ApplicationController
	before_action :logged_in_user, only: [:index, :create, :join]
	def new
		@game = Game.new
	end

	def create
		@user = current_user
		@game = Game.new(game_params)
    if @game.save
    	if @game.nick_name.empty?
    		@game.nick_name = "Game#{@game.id}"
    	else
    		@game.nick_name = "Game#{@game.id} \"#{@game.nick_name}\""
    	end
    	@game.save
    	@game.territory_owners.create!
		  @game.territory_reserves.create!
		  @game.players.create!(user_id: @user.id, admin: true)
      flash[:info] = "Game created sucessfully."
      redirect_to games_url
    else
      render 'new'
    end
	end

	def index
		@games = Game.all
	end

	def join
		@game = game(params)
	end

	private

	def game_params
      params.require(:game).permit(:num_of_players, :nick_name)
    end

end
