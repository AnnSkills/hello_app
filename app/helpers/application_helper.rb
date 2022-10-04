module ApplicationHelper
  def gravatar_for(user, option = {size: 80})
    email_address = user.email.to_s.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = option[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #not to go to db each time
  end

  def logged_in?
    !!@current_user
  end
end
