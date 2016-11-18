class ImagesController < ApplicationController
  def index
    @images = Image.paginate(page: params[:page], per_page: 1)
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
