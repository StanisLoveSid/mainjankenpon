class LikehistoryController < ApplicationController

	
helper_method :current_user
before_action :authenticate_user!, except: [:index, :show]
before_filter :set_locale


  def index
		@lessons = Lesson.all
		@user == current_user 
  end


private
	def lesson_params
		params.require(:lesson).permit(:title, :body, :id)
	end

end























