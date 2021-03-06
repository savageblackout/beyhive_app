class CommentsController < ApplicationController
  before_action :authenticate

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user = current_user

    if @comment.save
      redirect_to posts_path(params[:post_id])
    else
      render posts_path(params[:post_id])
    end
  end

  def destroy
    comment = Comment.find params[:id]
    if comment.user == current_user
      comment.destroy
    end
    redirect_to post_path(comment.post)
  end

private

  def comment_params
    params.require(:comment).permit(:text)
  end

end

