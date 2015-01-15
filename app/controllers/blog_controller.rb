class BlogController < ApplicationController

  before_action :authenticate, only: [:create, :new]

  def index
    @posts = Blog.all.order("updated_at DESC")
  end

  def create
    post = Blog.new blog_params
    post.author = session[:user_id]
    if post.save
      redirect_to post
    else
      redirect_to new_blog_path, notice: post.errors.full_messages.join("; ")
    end
  end

  def new
    @post = Blog.new
  end

  def show
    @post = Blog.find(params[:id])
    @author = Author.find(@post.author)
    @post.increment!(:view_count)
    @comments = Comment.all
    @comment = Comment.new
  end

  private

  def authenticate
    # URGENT
    # TODO This is just a dummy authentication and will be updated later
    if session[:user_id].nil?
      session[:user_id] = 2
    end
  end

  def blog_params
    params.require(:blog).permit([:title, :body])
  end

end
