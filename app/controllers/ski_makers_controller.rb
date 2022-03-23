class SkiMakersController < ApplicationController

  def index
    @ski_makers = SkiMaker.all
  end

end
