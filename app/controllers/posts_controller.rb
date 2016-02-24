class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(self.post_params)

    if @post.save
        redirect_to posts_path
      else
        render :new
      end
  end


def post_params
    params.require(:post).permit(
      :title,
      :text_post,
      :photo,
      :embed_url,
      :created_on
    )
  end


end
