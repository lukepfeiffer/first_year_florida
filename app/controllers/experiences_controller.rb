class ExperiencesController < ApplicationController
  def index
    if params[:user_id].present?
      @user = User.where(id: params[:user_id]).first
    else
      @user = User.last
    end
    @experiences = @user.experiences.paginate(page: params[:page], per_page: 1)
  end

  def new
    @experience = Experience.new
  end

  def create
    image = Experience.new(experience_params)
    image.user_id = current_user.id
    if image.save
      redirect_to user_path(current_user.id)
    else
      redirect_to :new
    end
  end

  private

  def experience_params
    params.require(:experience).permit(
      :url,
      :date,
      :description,
      :user_id,
      :title
    )
  end
end
