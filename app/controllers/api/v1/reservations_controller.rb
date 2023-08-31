class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  def index
    @user = User.find_by(id: params[:user_id])
    @reservations = Reservation.where(user: @user)
    render json: @reservations
  end

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

  def create
    user = User.find_by(id: params[:user_id])
    item = Item.find_by(id: params[:item_id])
    reservation = Reservation.new(date: params[:date], city: params[:city], user: user)

    if reservation.save
      # Associate the reservation with the item using the join table
      ItemReservation.create(item: item, reservation: reservation)

      render json: { message: 'Reservation created successfully.', reservation: }, status: :created,
             location: api_v1_reservation_url(reservation)
    else
      render json: { message: 'Failed to create reservation.', errors: reservation.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: { message: 'Reservation updated successfully.' }
    else
      render json: { message: 'Failed to update reservation.', errors: @reservation.errors.full_messages },
             status: :unprocessable_entity
    end
  end
  

  def destroy
    @reservation = Reservation.find(params[:id])

    if @reservation
      begin
        ActiveRecord::Base.transaction do
          @reservation.item_reservations.destroy_all
          @reservation.destroy
        end
        render json: { message: 'Reservation and associated data successfully deleted.' }, status: :ok
      rescue StandardError => e
        render json: { message: 'Failed to delete reservation and associated data.', error: e.message },
               status: :unprocessable_entity
      end
    else
      render json: { message: 'Reservation not found.' }, status: :not_found
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:date, :city, :user_id)
  end
end
