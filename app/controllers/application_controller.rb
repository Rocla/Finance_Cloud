class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :get_user, :is_user, :is_admin

  def get_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_user
    !!get_user
  end

  def require_user
    if !is_user
      flash[:error] = "You are not logged in"
      redirect_to root_path
    end
  end

  # TODO admin status
  def is_admin
    return false
  end

  # TODO admin status
  def require_admin
    if !is_user
      flash[:error] = "You are not logged in"
      redirect_to root_path
    end
  end

end
