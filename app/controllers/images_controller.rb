class ImagesController < ApplicationController
  def index
    @images = Image.paginate(page: params[:page], per_page: 1)
  end
end
