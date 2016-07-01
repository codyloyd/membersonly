class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?

  def sign_in user
    user.update_attribute(:remember_token, user.create_encrypted_token)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    current_user = nil
    cookies[:remember_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end
  def logged_in_user
    unless logged_in?
      flash[:warning] = "you gotta log in first...."
      redirect_to login_url
    end
  end
end
