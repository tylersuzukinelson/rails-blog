class BlogController < ApplicationController

  def index
    @posts = Blog.all.order("updated_at DESC")
  end

  def create
    # TODO
    render Text: "Herro"
  end

  def new
    
  end

  def show
    @post = Blog.find(params[:id])
    @author = Author.find(@post.author)
    @post.increment!(:view_count)
    @comments = Comment.all
    @comment = Comment.new
  end

end
