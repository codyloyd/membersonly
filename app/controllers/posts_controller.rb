class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @user = current_user
  end

  def create
    @user = current_user
    post = @user.posts.new(text: params[:post][:text])
    if post.save
      flash[:success] = "posted bro"
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
