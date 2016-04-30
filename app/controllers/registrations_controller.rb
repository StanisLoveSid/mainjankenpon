class RegistrationsController < Devise::RegistrationsController
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

end
