class ErrandsController < ApplicationController
  before_action :find_errand, only: [:update,:destroy]
  #before_action :authenticate_user!
  #before_action :authorize, only: [:edit,:update,:destroy]

  def create
    set_errand
    logger.debug("errand_params:")
    logger.debug(errand_params)
    @errand.owner = current_user
    if @errand.save
      logger.debug("Errand Created");
      render json: {result: "success"}
    else
      logger.debug("Adding Errand FAILED");
      render json: {result: "error"}
    end
  end
  def index
    @my_owned_errands     = Errand.where("owner_id = :search_id",search_id: current_user.id)
    @my_running_errands   = Errand.where("runner_id = :search_id",search_id: current_user.id)
    @my_errands           = Errand.where("owner_id = :search_id OR runner_id = :search_id",search_id: current_user.id)
    @open_errands         = Errand.where("aasm_state LIKE :search_state", search_state: "posted")
    @my_posted_errands    = Errand.where("owner_id = :search_id AND aasm_state LIKE :search_state",search_id: current_user.id, search_state: "posted")
    @other_posted_errands = Errand.where("owner_id != :search_id AND aasm_state LIKE :search_state",search_id: current_user.id, search_state: "posted")
    @my_accepted_errands  = Errand.where("runner_id = :search_id AND aasm_state LIKE :search_state",search_id: current_user.id, search_state: "accepted")
    @my_completed_errands = Errand.where("owner_id = :search_id AND aasm_state LIKE :search_state",search_id: current_user.id, search_state: "completed")
    @result = "success"
    #render json: {result: "success",
    #              my_posted_errands: @my_posted_errands,
    #              my_accepted_errands: @my_accepted_errands,
    #              my_completed_errands: @my_completed_errands}
    #respond_to do |format|
    #  format.html { @errands = @my_errands }
    #end
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
    params.require(:errand).permit(:title,:item_name,:price,:store,:aasm_state,:runner_id)
  end
end
