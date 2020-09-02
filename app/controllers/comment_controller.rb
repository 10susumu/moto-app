class CommentController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to "/content/#{@comment.content_id}"
  end


  private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :content_id)
  end
end
