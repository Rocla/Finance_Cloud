class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user?, :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user?
    !!current_user
  end

  def require_user
    if !user?
      flash[:error] = "You are not logged in"
      redirect_to root_path
    end
  end

  # TODO admin status
  def admin?
    return false
  end

  # TODO admin status
  def require_admin
    if !admin?
      flash[:error] = "You are not an admin"
      redirect_to root_path
    end
  end

end
