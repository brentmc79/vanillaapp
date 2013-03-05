class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def require_user
    redirect_to login_url unless session[:user_id]
  end
end
