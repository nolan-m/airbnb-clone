class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if params[:picture]
      @picture.update(pictures_params)
    end
      redirect_to picture_path
  end

  def create
    @picture = Picture.new(pictures_params)
    if @picture.save
      flash[:notice] = "Picture created!"
    else
      flash[:notice] = "Picture upload unsucessful"
    end
      redirect_to property_path(pictures_params[:property_id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to(root_path)
  end

private

  def pictures_params
    params.require(:picture).permit(:image, :property_id)
  end
end
