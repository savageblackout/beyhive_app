class PostsController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

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
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.build(post_params)


    if @post.save
        redirect_to posts_path
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @post.update_attributes(params.require(:post).permit(
      :title, :text_post, :embed_url, :photo))
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = @post.destroy

    flash[:post] = "'#{@post.title}' removed!"
    redirect_to posts_path
  end

private

  def post_params
    params.require(:post).permit(
      :title,
      :text_post,
      :photo,
      :embed_url
    )
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def authorize
    if current_user != @post.user
      redirect_to post_path(@post), alert: "Not authorized - not your post buddy!"
    end
  end
end
