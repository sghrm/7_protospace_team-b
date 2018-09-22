class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    @tags = Tag.new
    @tags.prototype_tags.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    @tags = Tag.new(tag_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: :new }), alert: 'New prototype was unsuccessfully created'
    end
    @tags.save
  end

  def destroy
    prototype = Prototype.find(params[:id])
      prototype.destroy if prototype.user_id == current_user.id
    redirect_to action: :index
  end

  def show
    @prototype = Prototype.find_by(id: params[:id])
    @user = @prototype.user
    @likes_count = Like.where(prototype_id: @prototype.id).count
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def update
    if @prototype.user_id == current_user.id
      @prototype.update(prototype_params)
      redirect_to action: :show
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]
    )
  end

  def tag_params
    params.require(:tag).permit(prototype_tags_attributes: [:prototype_id, :tag_id])
  end

end
