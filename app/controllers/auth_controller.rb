class AuthController < ApplicationController
  def create
    #TODO: there is no authentication right now.
    user = User.find_by_email params[:email]
    unless user.nil?
      sign_in(user)
      render json: {  result: "success",
                      first_name: user.first_name,
                      last_name: user.last_name,
                      email: user.email
                   }
    else
      render json: {result: "error", message: "No user found"}
    end
  end

  def destroy
  end
end
