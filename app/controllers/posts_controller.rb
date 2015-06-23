class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to '/posts'
    else
      render :new
    end
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
    params.require(:post).permit(:title, :content, :date, :image1, :image2, :image3, :image4, :image5)
  end
end
