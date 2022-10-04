class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] #not to go to db each time
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform action"
      redirect_to login_path
    end
  end
end
