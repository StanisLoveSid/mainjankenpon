class LessonsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_filter :set_locale
	impressionist actions: [:show], unique: [:session_hash]
    caches_page :show, :new, :upvote, :downvote

    def search
        if params[:search].present?
           @lessons = Lesson.search(params[:search])
        else
           @lessons = Lesson.all
        end
    end

	def index
		@users = User.all
		@users = User.order(points: :desc)
		   if params[:tag].present? 
              @lessons = Lesson.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 6)
           else
              @lessons = Lesson.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
    
           end 
		
	end

	def new
		if current_user && current_user.admin?
          @lesson = Lesson.new
      else
      	redirect_to "/"
      end
	end

	def create
		@user = current_user
		@lesson = current_user.lessons.build(lesson_params)
	      if @lesson.save

	      	  PostMailer.post_created(@user).deliver
		      redirect_to @lesson
	      else
		      render 'new'
	      end
	end
	
	def show
		
		@lesson = Lesson.find(params[:id])
		@user = @lesson.votes_for.up.by_type(User).voters
		
	end

	def user_posts
		@lesson = Lesson.find(params[:id])
	end

	def edit
		if current_user && current_user.admin?
		   @lesson = Lesson.find(params[:id])
	    else
		   redirect_to "/"
	    end
	end

	def update
		@lesson = Lesson.find(params[:id])
		if @lesson.update(params[:lesson].permit(:title, :body, :link, :image, :video, :tag_list, :leksika))
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

    def upvote
    	@lesson = Lesson.find(params[:id])
    	@lesson.upvote_by current_user
    	respond_to do |format|
    		format.html {redirect_to :back }
    		format.json { render json: { count: @lesson.get_upvotes.size } }
    	end
    end

    def downvote
    	@lesson = Lesson.find(params[:id])
    	@lesson.downvote_by current_user
    	respond_to do |format|
    		format.html {redirect_to :back }
    		format.json { render json: { count: @lesson.get_downvotes.size  } }
    	end
    end


    

     def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @lesson
      redirect_to :back, notice: 'You favorited #{@lesson.name}'

    elsif type == "unfavorite"
      @current_user.favorites.delete(@lesson)
      redirect_to :back, notice: 'Unfavorited #{@lesson.name}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end


	private
	def lesson_params
		params.require(:lesson).permit(:title, :body, :id, :link, :image, :video, :tag_list, :leksika)
	end

	

end





















