class SkisController < ApplicationController

  def index
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
    updated_ski.update(ski_params)
    updated_ski.save
    redirect_to "/skis/#{updated_ski.id}"
  end

  def destroy
    Ski.destroy(params[:id])
      redirect_to "/skis"
  end

  private
    def ski_params
      params.require(:ski).permit(:model, :ski_type, :longest_offered_cm, :symmetrical)
    end

end
