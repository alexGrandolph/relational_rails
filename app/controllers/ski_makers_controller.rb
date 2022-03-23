class SkiMakersController < ApplicationController

  def index
    @ski_makers = SkiMaker.all
  end

  def show
    
  end

end
