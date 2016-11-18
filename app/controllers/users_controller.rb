class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @experiences = current_user.experiences.order("created_at DESC")
  end

  def random_user
    user = User.all.sample(1)
    redirect_to experiences_path(user_id: user.first.id)
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
