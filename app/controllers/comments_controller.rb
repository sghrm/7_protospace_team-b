class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
      @comment = Comment.create(comment_params)
      redirect_to "/prototypes/#{@comment.prototype.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :text).merge(prototype_id: params[:prototype_id])
  end
end
