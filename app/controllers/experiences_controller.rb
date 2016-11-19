class ExperiencesController < ApplicationController
  def index
    if params[:user_id].present?
      @user = User.where(id: params[:user_id]).first
    else
      @user = User.last
    end
    @experiences = @user.experiences.active.paginate(page: params[:page], per_page: 1)
  end

  def new
    @experience = Experience.new
  end

  def archived
    @experiences = current_user.experiences.archived
  end

  def create
    experience = Experience.new(experience_params)
    experience.user_id = current_user.id
    if experience.save
      redirect_to user_path(current_user.id)
    else
      redirect_to :new
    end
  end

  def unarchive
    experience = Experience.find(params[:experience_id])
    experience.update(archive_date: nil)
    head :no_content
  end

  def destroy
    experience = Experience.find(params[:id])
    experience.update(archive_date: DateTime.now)
    head :no_content
  end


  private

  def experience_params
    params.require(:experience).permit(
      :image_url,
      :date,
      :description,
      :user_id,
      :title
    )
  end
end
