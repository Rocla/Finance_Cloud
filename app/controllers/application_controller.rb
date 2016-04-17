class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user?, :admin?, :moderator?

  # TODO migration -> rank table
  USER_RANK = 0
  MODO_RANK = 1
  ADMIN_RANK = 2

  # set will_paginate per_page globally
  WillPaginate.per_page = 9

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user?
    !!current_user
  end

  def require_user
    if !user?
      flash[:error] = "You are not logged in"
      redirect_to login_path
    end
  end

  def admin?
    if user?
      current_user.rank >= ADMIN_RANK
    end
  end

  def require_admin
    if !admin?
      flash[:error] = "You are not an admin"
      redirect_to root_path
    end
  end

  def moderator?
    if user?
      # TODO not sure about how nice this is... admin? alone would be great...
      if admin?
        admin?
      else
        current_user.rank == MODO_RANK
      end
    end
  end

  def require_moderator
    if !moderator?
      flash[:error] = "You are not a moderator or an admin"
      redirect_to root_path
    end
  end

end
