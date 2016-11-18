class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = user.new(user_params)
    if user.save
      sign_in(user)
      redirect_to images_path
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :username
    )
  end
end
