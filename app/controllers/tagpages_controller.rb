class TagpagesController < ApplicationController

	before_filter :set_locale
	



	def index
		   if params[:tag].present? 
              @lessons = Lesson.tagged_with(params[:tag])
           else
              @lessons = Lesson.all.order("created_at DESC")
           end 
		
	end

	
	def show
		@lesson = Lesson.find(params[:id])
		
	end

	def user_posts
		@lesson = Lesson.find(params[:id])
	end


	def update
		@lesson = Lesson.find(params[:id])
		if @lesson.update(params[:lesson].permit(:title, :body, :image, :tag_list))
		   redirect_to @lesson
		else
			render 'edit'
		end
	end

	def destroy

		@lesson = Lesson.find(params[:id])
		@lesson.destroy

		redirect_to root_path
	end


	private
	def post_params
		params.require(:lesson).permit(:title, :body, :id, :image, :tag_list)
	end

end
























