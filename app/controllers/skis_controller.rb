class SkisController < ApplicationController

  def index
    @skis = Ski.all
  end

  def show
    @ski = Ski.find(params[:id])
  end

  def edit
    @ski = Ski.find(params[:id])
  end

end
