class SkiMakersController < ApplicationController

  def index
    @ski_makers = SkiMaker.all
  end

  def show
    @ski_maker = SkiMaker.find(params[:id])
  end

  def skis
    @ski_maker = SkiMaker.find(params[:id])
    @skis = @ski_maker.skis
  end



end
