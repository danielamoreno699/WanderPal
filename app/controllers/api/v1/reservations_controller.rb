class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /api/v1/reservations
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  # GET /api/v1/reservations/1
  def show
    render json: @reservation
  end

# POST /api/v1/reservations
def create
  user = User.find_by(id: params[:user_id])
  item = Item.find_by(id: params[:item_id])
  reservation = Reservation.new(date: Date.parse(params[:date].to_s), city: params[:city], user: user)

  if reservation.save
    # Associate the reservation with the item using the join table
    ItemReservation.create(item: item, reservation: reservation)
    
    render json: { message: "Reservation created successfully." }
  else
    render json: { message: "Failed to create reservation.", errors: reservation.errors.full_messages }
  end
end


  # PATCH/PUT /api/v1/reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: { message: "Reservation updated successfully." }
    else
      render json: { message: "Failed to update reservation." }
    end
  end

  # DELETE /api/v1/reservations/1
  def destroy
    @reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :city)
  end
end
