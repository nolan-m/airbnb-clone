class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if params[:reservation]
      @reservation.update(reservations_params)
    end
      redirect_to reservation_path
  end

  def create
    @reservation = Reservation.new(reservations_params)
    if @reservation.save
      flash[:notice] = "Reservation created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to(root_path)
  end

private

  def reservations_params
    params.require(:reservation).permit(:user_id, :property_id, :start_date, :end_date)
  end
end
