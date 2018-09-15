class NewestController < ApplicationController

  def index
    @prototypes = Prototype.all.order(created_at: :DESC)
  end

end
