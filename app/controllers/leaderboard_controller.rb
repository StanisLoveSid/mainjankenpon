class LeaderboardController < ApplicationController

  def index
  	@users = User.all
	@users = User.order(points: :desc)
  end

end
