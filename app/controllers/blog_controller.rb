class BlogController < ApplicationController

  def index
    @posts = Blog.all.order("updated_at DESC")
  end

  def post
    @post = Blog.find(params[:id])
    @author = Author.find(@post.author)
    @post.view_count += 1
    @post.save
    @comments = Comment.all
  end

end
