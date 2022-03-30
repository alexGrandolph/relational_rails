class SkiMakerSkisController < ApplicationController

  def index
    if params[:sort] == 'alpha'
      @ski_maker = SkiMaker.find(params[:id])
      @skis = @ski_maker.sort_alpha

    elsif params[:longest_offered_cm]
      length = params[:longest_offered_cm]
      @ski_maker = SkiMaker.find(params[:id])
      @skis = @ski_maker.over_given_length(length)
    else
      @ski_maker = SkiMaker.find(params[:id])
      @skis = @ski_maker.skis
    end
  end

  def new
    @ski_maker = SkiMaker.find(params[:id])
  end

  def create
    @ski_maker = SkiMaker.find(params[:id])
    @new_ski = @ski_maker.skis.create(skis_params)
    @new_ski.save
    redirect_to "/ski_makers/#{@ski_maker.id}/skis/"
  end

  private
    def skis_params
      params.require(:ski).permit(:model, :ski_type, :longest_offered_cm, :symmetrical)
    end

end
