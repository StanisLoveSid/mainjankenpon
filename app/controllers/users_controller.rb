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
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
     

   #  if (@user.purchase % params[:b].to_i >= params[:b].to_i - 1 && @user.purchase % params[:b].to_i < params[:b].to_i && @user.purchase+(params[:b].to_i - 1 ) != 0 )
   #    @message = "У Вас уже есть этот предмет"

   #   else

     if @user.points >= params[:a].to_i 
      @user.points -= params[:a].to_i
      @user.purchase += 1
      
      redirect_to '/users/'+current_user.id.to_s+'/hero'
      else  
        @message = "Не хватает поинтов для улучшения. Для полученя поинтов изучайте уроки и проходите тесты"
      end
      @user.save
     #@a = @user.purchase.to_i
     #@a = @a + params[:b].to_i
     #@user.purchase = @a
    
  end

  def addpoints
    
    @list = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    @data1 = params[:radio]
    @data2 = params[:radio1]
    @data3 = params[:radio2]

    @count = params[:count].to_i
    if current_user.points == nil
        current_user.points = 0 
      end
    #@proverka1 = params[:proverka1]
    #@proverka2 = params[:proverka2]
    #@proverka3 = 0
    #for i in 0..3
     # @proverka3 += @list.index(@proverka2[i])
    #end    
    @summa = @data1.to_i + @data2.to_i + @data3.to_i
    #if @proverka3 != @proverka1.to_i
     # @summa = 0
    #end
    @simvol = @list[@summa]


    if (current_user.tests == nil)
    current_user.tests = '0'
    current_user.save
    end
    if (@summa > 1)
    @data5 = current_user.points
    if (@count + 1 > (current_user.tests).length)
    current_user.tests += @simvol
    @data5 = @data5 + @summa
    current_user.points = @data5
    elsif (@summa > @list.index(current_user.tests[@count]))
    @data5 = @data5 + @summa - @list.index(current_user.tests[@count])
    current_user.tests[@count] = @simvol
    current_user.points = @data5
   
    end
    current_user.save
      
  end
  end




  def saveresult
    #@user.points += params[:result].to_i
    #@user.save
  end


# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

   def user_params
      params.require(:user).permit(:avatar, :name, :id, :points, :purchase, :tests)
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
