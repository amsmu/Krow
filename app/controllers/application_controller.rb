class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def logged_in?
    current_user
  end
  helper_method :logged_in?
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



  def require_user
  	if current_user
  		true
  	else
  		redirect_to new_user_session_path
    end
  end
  def home_user
    if current_user
      redirect_to todo_lists_path
    end
  end
end
