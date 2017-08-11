class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # check_authorization

  rescue_from CanCan::AccessDenied do |exception|
     redirect_to main_app.root_path, :alert => exception.message
   end
end
