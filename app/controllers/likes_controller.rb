class LikesController < ApplicationController
	def create
		@like = Like.create(user_id: courrent_user.id, prototype_id: params[:prototype_id])
		@likes = Like.where(prototype_id: params[:prototype_id])
		@prototypes = Prototype.all
	end

	def destroy
		like = Like.find_by(user_id: courrent_user.id, prototype_id: params[:prototype_id])
		like.destroy
		@likes = Like.where(prototype_id: params[:prototype_id])
		@prototypes = Prototype.all
	end
end