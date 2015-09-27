class ErrandsController < ApplicationController
  before_action :find_errand, only: [:update,:destroy]
  before_action :authenticate_user!
  before_action :authorize, only: [:edit,:update,:destroy]

  def create
    set_errand
    @errand.owner = current_user
    respond_to do |format|
      if @errand.save
        format.json do
          render json: {result: "success"}
        end
      else
        format.json do
          render json: {result: "error"}
        end
      end
    end
  end
  def index
    @errands = Errand.all
  end
  def update
   respond_to do |format|
      if @errand.update errand_params
        format.json do
          render json: {result: "success"}
        end
      else
        format.json do
          render json: {result: "error"}
        end
      end
    end
  end
  def destroy
    @errand.destroy
    respond_to do |format|
      format.json do
        render json: {result: "success"}
      end
    end
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
