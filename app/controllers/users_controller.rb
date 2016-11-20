class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    if params[:search].present?
      @users = User.fuzzy_search(username: params[:search])
    else
      @users = User.all
    end
  end

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @experiences = current_user.experiences.active.order("created_at DESC")
    else
      redirect_to experiences_path(user_id: 1)
    end
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
