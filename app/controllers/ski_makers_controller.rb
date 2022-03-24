class SkiMakersController < ApplicationController

  def index
    @ski_makers = SkiMaker.all
  end

  def show
    @ski_maker = SkiMaker.find(params[:id])
  end

  def children
    makers = SkiMaker.children

  end

end
