class PostsController < ApplicationController

  before_action :check_if_admin

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.save
    render :new
  end

  def edit 
    @post = Post.find params[:id]
    render :edit
  end

  def update
    post = Post.find params[:id]
    post.update post_params
    redirect_to post_path
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to '/posts'
  end

  def show
    @post = Post.find params[:id]
  end

  private
   def post_params
    params.require(:post).permit(:title, :content, :date, :image)
  end

  def check_if_admin
    redirect_to root_path unless current_user.present? && current_user.profile.admin?
  end
end
