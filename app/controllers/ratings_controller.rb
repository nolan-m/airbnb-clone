class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      respond_to do |format|
        format.html { redirect_to user_path(@rating.user_id) }
        format.js
      end
    else
      flash[:notice] = "Update Error"
      redirect_to :back
    end
  end


private
  def rating_params
    params.require(:rating).permit(:user_id, :property_id, :score, :review, :reservation_id)
  end
end
