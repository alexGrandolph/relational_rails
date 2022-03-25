class SkiMakersController < ApplicationController

  def index
    @ski_makers = SkiMaker.most_recent

  end

  def show
    @ski_maker = SkiMaker.find(params[:id])
    @count = @ski_maker.skis.count

  end

  def skis
    @ski_maker = SkiMaker.find(params[:id])
    @skis = @ski_maker.skis
  end

  def new

  end



end
