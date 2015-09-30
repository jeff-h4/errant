class ErrandsController < ApplicationController
  before_action :find_errand, only: [:update,:destroy]
  #before_action :authenticate_user!
  #before_action :authorize, only: [:edit,:update,:destroy]

  def create
    set_errand
    @errand.owner = current_user
    if @errand.save
      render json: {result: "success"}
    else
      render json: {result: "error"}
    end
  end
  def index
    @errands = Errand.all
    #render json: {result: "success"}
    render json: @errands
  end
  def update
    if @errand.update errand_params
      render json: {result: "success"}
    else
      render json: {result: "error"}
    end
  end
  def destroy
    @errand.destroy
    render json: {result: "success"}
  end
  private
  def set_errand
    @errand = Errand.new errand_params
  end
  def find_errand
    @errand = Errand.find params[:id]
  end
  def errand_params
    params.require(:errand).permit(:title,:item_name,:price,:store)
  end
end
