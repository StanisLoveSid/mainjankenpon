class UsersController < ApplicationController
	before_filter :set_locale

 
   

  def index

    
    @users = User.all
  
  end

  def edit
    if current_user && current_user.admin?
       @user = User.find(params[:id])
      else
       redirect_to "/"
      end
  end


    def search

    if params[:search].present?
      @users = User.search(params[:search])
    else
      @users = User.all
      
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @users2.errors, status: :unprocessable_entity }
      end
    end
end

    def proba
    end

  def proba2
    @data = params[:radios1] + params[:radios2]
  end

  def hero 
    @user = User.find(params[:id])
  end

  def changehero
  end

  def savehero
     @user = current_user
     @user.herotype = params[:number].to_i
     @user.save
     redirect_to "/"
  end

  def shop
  end

  def buy
     @user = current_user
     if @user.points == nil
        @user.points = 0 
      end

      if @user.purchase == nil
        @user.purchase = 0 
      end
     @user.points -= params[:a].to_i
     @user.purchase += params[:b].to_i  
     #@a = @user.purchase.to_i
     #@a = @a + params[:b].to_i
     #@user.purchase = @a
     @user.save
     redirect_to '/users/'+current_user.id.to_s+'/hero'
  end

  def addpoints
    
    @data1 = params[:radio]
    @data2 = params[:radio1]
    @data3 = params[:radio2]
    @data4 = params[:aaa]
    @summa = @data1.to_i + @data2.to_i + @data3.to_i
    #@id = params[:aaa]
    @user = User.find(params[:id])
    if (@summa > 1)
       if @user.points == nil
        @user.points = 0 
      end

      if @user.purchase == nil
        @user.purchase = 0 
      end
    @data5 = @user.points
    @data5 = @data5 + @summa
    @user.points = @data5
    @user.save
      
  end

  end

  def saveresult
    #@user.points += params[:result].to_i
    #@user.save
  end


# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

   def user_params
      params.require(:user).permit(:avatar, :name, :id, :points, :purchase)
   end

   def lesson_params
		params.require(:post).permit(:title, :body, :id)
   end

	private
	def locale
		I18n.locale = params[:locale] if params[:locale].present?
		# @user.locale
		# request.subdomain
		# request.env["HTTP_ACCEPT_LANGUAGE"]
		# request.remote_ip
	end


end
