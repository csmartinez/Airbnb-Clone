class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def create
    room = Room.new(room_params)
    current_user.rooms << room
    if room.save
      flash[:notice] = "Success adding room!!"
      redirect_to '/'
    else
      flash[:alert] = "Failed to add room."
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:size, :amenities, :location, :user_id)
  end
end
