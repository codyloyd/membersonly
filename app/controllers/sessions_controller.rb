class SessionsController < ApplicationController

  def new
  end

  def create
    #find user based on email address on form_for
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      flash[:success] = "sup #{user.name}.. welcome home"
      redirect_to root_url
    else
      flash.now[:danger] = "NOPE-> TRY AGAIN"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = "you're out"
    redirect_to root_url
  end

end
