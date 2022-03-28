class SkiMakerSkisController < ApplicationController


  def index
    @ski_maker = SkiMaker.find(params[:id])
    @skis = @ski_maker.skis
  end

  def new
    @ski_maker = SkiMaker.find(params[:id])
  end

  def create
    @ski_maker = SkiMaker.find(params[:id])
    @new_ski = @ski_maker.skis.create({
      model: params[:ski][:model],
      ski_type: params[:ski][:ski_type],
      longest_offered_cm: params[:ski][:longest_offered_cm],
      symmetrical: params[:ski][:symmetrical]
      })
    @new_ski.save
    redirect_to "/ski_makers/#{@ski_maker.id}/skis/"
  end



end
