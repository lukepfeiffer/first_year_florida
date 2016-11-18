class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @images = current_user.images.order("created_at DESC")
  end

  def create
    user = User.new(user_params)
    if user.save
      sign_in(user)
      redirect_to user_path(user.id)
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
