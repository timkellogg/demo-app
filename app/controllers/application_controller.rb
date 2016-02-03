class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  
  # Allows customer attributes to be passed in from a form when signing up
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:avatar_file_name, :avatar_content_type,
        :avatar_file_size, :avatar_updated_at, :company_name, :country_id, :firstname,
        :international, :invitation_id, :lastname, :name, :title, :roles_mask)
  end
  
end

