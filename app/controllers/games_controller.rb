class GamesController < ApplicationController
	before_action :logged_in_user, only: [:new, :index, :create, :join, :destroy, :edit, :update]
	before_action :correct_user, only: [:destroy, :edit, :update]

	def new
		@game = Game.new(num_of_players: 3)
	end

	def show
		@game = Game.find(params[:id])
	end

	def create
		@user = current_user
		@game = Game.new(game_params)
		time = Time.now.to_formatted_s(:number)
    if @game.save
    	if @game.nick_name.empty?
    		@game.nick_name = "#{@user.name}#{time}"
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
		@game = Game.find(params[:id])
		if @game.active
			flash[:info] = "You cannot join this game"
			redirect_to game_url
		end
		@user = current_user
		@player = @user.players.new(game_id: @game.id)
		if @player.save
			if players_met?(@player.game)
				@game.active = true
				@game.save
				#start the game
			end
			 flash[:info] = "Game joined sucessfully."
			 redirect_to game_url
		end
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
    params.require(:game).permit(:num_of_players, :nick_name)
  end
  def correct_user
  	@game = Game.find(params[:id])
  	@user = @game.players.where(admin:true).first.user
  	unless @user == current_user
      flash[:danger] = "Action not allowed!"
      redirect_to(message_url)
    end
  end
  def players_met?(game)
  	game.players.count == game.num_of_players
  end
end
