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

  def create
    new_maker = SkiMaker.new({
      company_name: params[:ski_maker][:company_name],
      years_active: params[:ski_maker][:years_active],
      makes_snowboards: params[:ski_maker][:makes_snowboards]
      })
    new_maker.save
    redirect_to '/ski_makers/'
  end

  def edit
    @ski_maker = SkiMaker.find(params[:id])
  end

  def update
    # require "pry"; binding.pry
    updated_maker = SkiMaker.find(params[:id])
    updated_maker.update({
      company_name: params[:ski_maker][:company_name],
      years_active: params[:ski_maker][:years_active],
      makes_snowboards: params[:ski_maker][:makes_snowboards]
      })
    updated_maker.save
    redirect_to "/ski_makers/#{updated_maker.id}"

  end



end
