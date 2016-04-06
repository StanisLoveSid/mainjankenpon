class UserpostsController < ApplicationController

	
helper_method :user
before_action :authenticate_user!, except: [:index, :show]
before_filter :set_locale


  def index
		@users = User.all
		
  end


private
	def user_params
		params.require(:user).permit(:name, :id)
	end

end

