class PostsController < ApplicationController

  def index
    if params[:video]
      @posts = Post.videos
    elsif params[:photo]
      @posts = Post.photos
    elsif params[:text_posts]
      @posts = Post.text_posts
    else
      @posts = Post.all
    end
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(
      :title, :text_post, :embed_url, :photo))
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def post_params
      params.require(:post).permit(
        :title,
        :text_post,
        :photo,
        :embed_url
      )
  end


end
