class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @user = current_user
  end

  def create
    post = Post.new(user_id:current_user.id, text: params[:post][:text])
    if post.save
      flash[:success] = "post posted"
      redirect_to posts_url
    else
      flash[:danger] = "something broke"
      render 'new'
    end
  end

  def index
    @user = current_user
    @posts = Post.all
  end
end
