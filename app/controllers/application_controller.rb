class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # check_authorization

  protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :first_name, :last_name, :password) }
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
		devise_parameter_sanitizer.for(:account_update)  { |u| u.permit(:email, :first_name, :last_name, :password, :current_password, :role_ids) }
	end

	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
