module ApplicationHelper
  def get_gravatar(user, options={size: 50})
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_api_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_api_url, alt: user.username)
  end
end
