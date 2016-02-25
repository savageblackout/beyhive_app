class CommentsController < ApplicationController
  def create
    @comment = Comment.new(self.comment_params)

    if @comment.save
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params.require(:comment).permit(self.comment_params))
      redirect_to post_path(post)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(post)
  end

private

def comment_params
      params.require(:comment).permit(
        :user_id,
        :text,
        :post_id
      )
  end

end

