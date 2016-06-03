class RegistrationsController < Devise::RegistrationsController


  prepend_before_action :check_captcha, only: [:create]

  def create
  	super do
     @user.tests = '0'
     @user.points = 0
    end
  end



 protected
  def update_resource(resource, params)
      resource.update_without_password(params.except(:current_password))
  end

  def check_captcha
      if verify_recaptcha
        true
      else
        self.resource = resource_class.new sign_up_params
        respond_with_navigational(resource) { render :new }
      end 
    end

end
