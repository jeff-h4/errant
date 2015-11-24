class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    # Note: there is no session object, unlike most other controllers
    @user = User.find_by_email params[:email]
    byebug
    if @user && @user.authenticate(params[:password])
      Rails.logger.debug("Session: User Sign In Successful")
      session[:user_id] = @user.id
      redirect_to errands_path, notice: "Signed in Successfully"
    else
      Rails.logger.debug("Session: User Authentication failed")
      flash[:alert] = "Wrong credentials!"
      render :new
    end
  end
  def destroy 
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully"
  end
end
