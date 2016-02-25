class CommentsController < ApplicationController


  def create
    @comment = Comment.new(:post_id => params[:post_id])
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to posts_path(params[:post_id])
    else
      render posts_path
    end
  end

  def destroy
    if params[:post_id]

    post = Post.find params[:post_id]
    comment = Comment.find params[:id]

    comment.delete

    redirect_to post_path(post)
    end

  end

private

def comment_params
      params.require(:comment).permit(:text)
end

end

