class SkisController < ApplicationController

  def index
    # @skis = Ski.all
    @skis = Ski.all_true
  end

  def show
    @ski = Ski.find(params[:id])
  end

  def edit
    @ski = Ski.find(params[:id])
  end

  def update
    updated_ski = Ski.find(params[:id])
    updated_ski.update({
      model: params[:ski][:model],
      ski_type: params[:ski][:ski_type],
      longest_offered_cm: params[:ski][:longest_offered_cm],
      symmetrical: params[:ski][:symmetrical]
      })
    updated_ski.save
    redirect_to "/skis/#{updated_ski.id}"
  end

end
