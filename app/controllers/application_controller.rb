class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def sign_in user
    user.remember_token = User.create_encrypted_token
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
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
end
