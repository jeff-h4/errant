class ErrandsController < ApplicationController
  before_action :find_errand, only: [:update,:destroy]

  def create
    set_errand
    respond_to |format| do
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
   respond_to |format| do
      if @errand.update
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
    respond_to |format| do
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
