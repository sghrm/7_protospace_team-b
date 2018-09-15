class NewestController < ApplicationController

  def index
    @prototypes = Prototype.all.order(created_at: :DESC)
    respond_to do |format|
      format.html
      format.json
    end
  end

end
