class ImagesController < ApplicationController
  def index
    @images = Image.paginate(page: params[:page], per_page: 1)
  end

  def new
    @image = Image.new
  end

  def create
    image = Image.new(image_params)
    image.user_id = current_user.id
    if image.save
      redirect_to user_path(current_user.id)
    else
      redirect_to :new
    end
  end

  private

  def image_params
    params.require(:image).permit(
      :url,
      :date,
      :description,
      :title
    )
  end
end
