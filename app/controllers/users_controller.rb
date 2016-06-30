class UsersController < ApplicationController
	before_filter :set_locale
        respond_to :js
 
   

  def index

    
    @users = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
  
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
   if @user = User.find_by_id(params[:id])
    @user
  else
      redirect_to wrong_page_path
    end
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

    if current_user.herotype == 0
       redirect_to '/users/'+current_user.id.to_s+'/changehero', notice: 'You have to choose your character before continue'
    end

    @user = User.find(params[:id])
  end

  def changehero

       if current_user.herotype == nil
      current_user.herotype = 0
      current_user.save
    end

         if current_user.herotype > 0 && current_user.herotype <= 3
            redirect_to root_path
         end

  end

  def savehero
     @user = current_user
     if @user.herotype > 0
      redirect_to "/", notice: 'Character is already selected'
    else
    @user.herotype = params[:number].to_i
     @user.save
      redirect_to "/", notice: 'Character is successfully selected'
    end
  end

  def shop

    if current_user.herotype == 0
       redirect_to '/users/'+current_user.id.to_s+'/changehero', notice: 'You have to choose your character before continue'
    end

    @list = [160, 320, 480, 700, 1000, 1500]
  end

  def buy
     @list = [160, 320, 480, 700, 1000, 1500]  
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

      @message = "Level up!"
      respond_with({:user_points => @user.points, :user_purchase => @user.purchase, :message => @message, :list => @list})
             
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
    hash1 = { true => 0, false => 1}
    hash2 = { true => -1, false => 1}
    @data1 = []
    @data1.push(params[:radio0].to_i)
    @data1.push(params[:radio1].to_i)
    @data1.push(params[:radio2].to_i)
    @data1.push(params[:radio3].to_i)
    @data1.push(params[:radio4].to_i) 
    @data1.push(params[:radio5].to_i)
    @data1.push(params[:radio6].to_i)
    @data1.push(params[:radio7].to_i)
    @data1.push(params[:radio8].to_i)
    @data1.push(params[:radio9].to_i)
    @data1.push(params[:radio10].to_i)
    @data1.push(params[:radio11].to_i)
    @data1.push(params[:radio12].to_i)
    @data1.push(params[:radio13].to_i)
    @data1.push(params[:radio14].to_i)
    @data1.push(params[:radio15].to_i)
    @data1.push(params[:radio16].to_i)
    @data1.push(params[:radio17].to_i)
    @data1.push(params[:radio18].to_i)
    @data1.push(params[:radio19].to_i)
    @data  = []
    @summa = 0

 
    @path1 = Rails.root.to_s+"/usertmp/"+current_user.id.to_s+"tmp.txt"
    @path2 = Rails.root.to_s+"/usertmp/"+current_user.id.to_s+"tmp2.txt"

    @array1 = File.readlines(@path1) 
    @array2 = File.readlines(@path2) 
    for i in 0..19
      
      @summa += @array2[@data1[i].to_i].to_i
    end 
    

    @count = params[:count].to_i
    if current_user.points == nil
        current_user.points = 0 
        current_user.rating = "Beginer"
     elsif current_user.points >= 2 || current_user.points <= 3
         current_user.rating = "Young student"
      elsif current_user.points >= 60 || current_user.points <= 100
         current_user.rating = "Student"
           elsif current_user.points >= 120 || current_user.points <= 160
         current_user.rating = "Wakai Gakusei"
      elsif current_user.points >= 180 || current_user.points <= 200
         current_user.rating = "Gakusei"
           elsif current_user.points >= 210 || current_user.points <= 220
         current_user.rating = "N5 Starter"
      elsif current_user.points >= 230 || current_user.points <= 240
         current_user.rating = "N5 Junior"
           elsif current_user.points >= 240 || current_user.points <= 270
         current_user.rating = "N5 Reviser"
      elsif current_user.points >= 280 || current_user.points <= 310
         current_user.rating = "N5 dreamer"
      end




     
    #@proverka1 = params[:proverka1]
    #@proverka2 = params[:proverka2]
    #@proverka3 = 0
    #for i in 0..3
     # @proverka3 += @list.index(@proverka2[i])
    #end    
   
    #if @proverka3 != @proverka1.to_i
     # @summa = 0
    #end
    @simvol = @list[@summa]


    if (current_user.tests == nil)
    current_user.tests = '0'
    current_user.save
    end
    if (@summa > 12)
      @message2 = "Тест успешно пройден!"
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
      else
        @message2 = "Тест не пройден. Вы ответили меньше чем на 60% вопросов. Просмотрите урок и пройдите тест заново."
  end
  end

  



  def saveresult
    #@user.points += params[:result].to_i
    #@user.save
  end


# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.



	private

   def user_params

      params.require(:user).permit(:avatar, :name, :id, :points, :purchase, :tests, :herotype, :rating)

   end



	def locale
		I18n.locale = params[:locale] if params[:locale].present?
		# @user.locale
		# request.subdomain
		# request.env["HTTP_ACCEPT_LANGUAGE"]
		# request.remote_ip
	end


end
