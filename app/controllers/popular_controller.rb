class PopularController < ApplicationController

  def index
    @prototypes = Prototype.all
  end

end
