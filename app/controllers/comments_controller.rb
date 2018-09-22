class CommentsController < ApplicationController
  def create
    #binding.pry
  Comment.create(comment_params)
    #binding.pry
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :text).merge(prototype_id: params[:prototype_id])
  end
end
