class ReservationsController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new()
  end

  def create
    reservation = Reservation.new({:user_id => current_user.id, :room_id => reservation_params[:room_id], :price => reservation_params[:price], :date => reservation_params[:date]})
    if reservation.save
      flash[:notice] = "Success!"
      redirect_to '/'
    else
      flash[:alert] = "Failure!"
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:price, :date)
  end
end
