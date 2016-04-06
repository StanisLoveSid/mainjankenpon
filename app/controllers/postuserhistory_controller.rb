class PostuserhistoryController < ApplicationController
helper_method :current_user
before_action :authenticate_user!, except: [:index, :show]
before_filter :set_locale


  def index
		@posts = Post.all
		@user == current_user 
  end


private
	def post_params
		params.require(:post).permit(:title, :body, :id)
	end

end
