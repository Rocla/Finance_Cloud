module ApplicationHelper
  def get_gravatar(user, options={size: 50})
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_api_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_api_url, alt: user.username)
  end

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
    !!get_user
  end

  # TODO admin status
  def require_admin
    if !is_user
      flash[:error] = "You are not logged in"
      redirect_to root_path
    end
  end
end
