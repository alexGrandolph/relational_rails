class SkiMakerSkisController < ApplicationController


  def index
    # require "pry"; binding.pry
    if params[:sort] == 'alpha'
      @ski_maker = SkiMaker.find(params[:id])
      @skis = @ski_maker.sort_alpha

    elsif params[:longest_offered_cm]
      length = params[:longest_offered_cm]
      @ski_maker = SkiMaker.find(params[:id])
      @skis = @ski_maker.over_given_length(length)
      # require "pry"; binding.pry
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

# /skis?order=alpha
# if params[:order] == 'alpha'
# skis.alphabatized
#
# else
# skis.all
