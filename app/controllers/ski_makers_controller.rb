class SkiMakersController < ApplicationController

  def index
    @ski_makers = SkiMaker.most_recent
  end

  def show
    @ski_maker = SkiMaker.find(params[:id])
  end

  def new
  end

  def create
    @new_maker = SkiMaker.new(maker_params)
    @new_maker.save
    redirect_to '/ski_makers/'
  end

  def edit
    @ski_maker = SkiMaker.find(params[:id])
  end

  def update
    updated_maker = SkiMaker.find(params[:id])
    updated_maker.update(maker_params)
    updated_maker.save
    redirect_to "/ski_makers/#{updated_maker.id}"
  end

  def destroy
    SkiMaker.destroy(params[:id])
    redirect_to '/ski_makers'
  end

  private
    def maker_params
      params.require(:ski_maker).permit(:company_name, :years_active, :makes_snowboards)
    end
end
