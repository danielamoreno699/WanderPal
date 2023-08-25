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

  def item_details
    @reservation = Reservation.includes(items: :item_reservations).find(params[:id])

    item_details = @reservation.items.map do |item|
      {
        item_id: item.id,
        name: item.name,
        image: item.image,
        reservation_ids: item.item_reservations.pluck(:reservation_id)
      }
    end

    reservation_ids = item_details.map { |details| details[:reservation_ids] }.flatten.uniq
    reservations = Reservation.where(id: reservation_ids)

    item_details.each do |details|
      details[:reservations] = reservations.select { |reservation| details[:reservation_ids].include?(reservation.id) }
    end

    render json: item_details
  end

  # POST /api/v1/reservations
  def create
    user = User.find_by(id: params[:user_id])
    item = Item.find_by(id: params[:item_id])
    reservation = Reservation.new(date: Date.parse(params[:date].to_s), city: params[:city], user:)

    if reservation.save
      # Associate the reservation with the item using the join table
      ItemReservation.create(item:, reservation:)

      render json: { message: 'Reservation created successfully.', reservation: }, status: :created,
             location: api_v1_reservation_url(reservation)
    else
      render json: { message: 'Failed to create reservation.', errors: reservation.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: { message: 'Reservation updated successfully.' }
    else
      render json: { message: 'Failed to update reservation.' }
    end
  end

  # DELETE /api/v1/reservations/1
  def destroy
    @reservation.destroy
    render json: { message: 'Reservation is deleted successfully.' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :city, :user_id)
  end
end
