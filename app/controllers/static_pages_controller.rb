class StaticPagesController < ApplicationController
	before_action :logged_in_user, only: :game

  def home
  end

  def help
  end

  def info
  end

  def game
  end
end
