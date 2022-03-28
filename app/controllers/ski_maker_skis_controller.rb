class SkiMakerSkisController < ApplicationController


  def index
    @ski_maker = SkiMaker.find(params[:id])
    @skis = @ski_maker.skis
  end




end
