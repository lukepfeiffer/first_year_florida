class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to user_path(user.id)
    else
      flash.now.alert = "Your email and password do not match"
      redirect_to new_user_path
    end
  end

  def destroy
    sign_out_user
    redirect_to :root
  end
end
