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
    #@errands = Errand.all
    @my_posted_errands    = Errand.where("owner_id = :search_id AND aasm_state LIKE :search_state",search_id: current_user.id, search_state: "posted")
    @my_accepted_errands  = Errand.where("runner_id = :search_id AND aasm_state LIKE :search_state",search_id: current_user.id, search_state: "accepted")
    @my_completed_errands = Errand.where("owner_id = :search_id AND aasm_state LIKE :search_state",search_id: current_user.id, search_state: "completed")

    render json: {result: "success",
                  my_posted_errands: @my_posted_errands,
                  my_accepted_errands: @my_accepted_errands,
                  my_completed_errands: @my_completed_errands}
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
