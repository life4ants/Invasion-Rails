class StaticPagesController < ApplicationController
  def home
    @games = current_user.games.find_by(active: true) if logged_in?
  end
  def help
  end
  def info
  end
end
