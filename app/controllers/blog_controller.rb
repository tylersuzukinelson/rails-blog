class BlogController < ApplicationController
  before_action :find_post, only: [:edit, :show, :update, :destroy]
  before_action :authenticate, only: [:create, :new]

  def index
    @posts = Blog.all.order("created_at DESC")
  end

  def create
    @post = Blog.new blog_params
    @post.author = session[:user_id]
    if @post.save
      redirect_to @post
    else
      redirect_to new_blog_path, notice: post_errors
    end
  end

  def new
    @post = Blog.new
  end

  def edit
  end

  def show
    @author = Author.find(@post.author)
    @post.increment!(:view_count)
    @comments = Comment.all
    @comment = Comment.new
  end

  def update
    if @post.update(blog_params)
      redirect_to @post
    else
      redirect_to @post, notice: post_errors
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      redirect_to @post, notice: post_errors
    end
  end

  private

  def authenticate
    # URGENT
    # TODO This is just a dummy authentication and will be updated later
    if session[:user_id].nil?
      session[:user_id] = 2
    end
  end

  def find_post
    @post = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit([:title, :body])
  end

  def post_errors
    @post.errors.full_messages.join("; ")
  end

end
