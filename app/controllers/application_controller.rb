class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def download_pdf
  send_file(
    "#{Rails.root}/public/your_file.pdf",
    filename: "your_custom_file_name.pdf",
    type: "application/pdf"
  )
end
   
def after_sign_in_path_for(resource)
  '/users/'+current_user.id.to_s+'/changehero'
end


   
   def require_admin
    redirect_to '/' unless current_user.admin? 
   end


  protected 
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:account_update) << :name
    end

    

      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :location, :email, :password, :password_confirmation) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :location, :email, :password, :current_password, :avatar) }
    end

  private 
  def set_locale
	  I18n.locale = params[:locale] if params[:locale].present?
	  # current_user.locale
	  # request.subdomain
	  # request.env["HTTP_ACCEPT_LANGUAGE"]
	  # request.remote_ip
  end

  def default_url_options(options = {})
  { locale: I18n.locale }.merge options
  end

  


end
