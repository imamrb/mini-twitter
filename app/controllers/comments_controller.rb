class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy

  def create
    params[:comment].merge!(author_id: current_user.id)
    comment = Comment.new(comment_params)

    if comment.save
      flash[:notice] = 'Comment successfully posted!'
    else
      flash[:error] = comment.errors.full_messages.join(', ')
    end

    redirect_to comment.commentable
  end

  def destroy
    @comment.destroy!
    flash[:notice] = 'Comment successfully deleted!'

    redirect_to @comment.commentable
  end

  private

  def set_comment
    binding.pry
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id, :author_id)
  end
end
