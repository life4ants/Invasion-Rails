require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  def setup
    @user = users(:michael)
    @malory = users(:malory)
    @game = games(:Game_one)
  end

  test "join a game" do
  	log_in_as(@user)
  	assert '@game.players.count == 3'
  	assert '@game.active == false'
  	post :join, id: @game
  	assert '@game.players.count == 4'
  	assert '@game.active == true'
  end
end
