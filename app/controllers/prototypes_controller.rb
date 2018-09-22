class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: :new }), alert: 'New prototype was unsuccessfully created'
     end
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
end
