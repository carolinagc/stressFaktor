class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
#    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def admin?
    current_user && current_user.admin?
  end

  def user_logged_in?
    user_sign_in? && !current_user.admin
  end

  def admin_required
    admin? || redirect_to_login
  end

  def user_logged_required
    user_logged_in? || redirect_to_login
  end

  def redirect_to_login
    redirect_to(:login, :notice =>"You are not admin...so you cannot be here")
  end


end
