class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  # GET /api/v1/items
  def index
    @items = Item.all.includes(:reservations)

    render json: @items
  end

  # GET /api/v1/items/1
  def show
    render json: @item
  end

  # POST /api/v1/items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: api_v1_item_url(@item)
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/items/1
  def destroy
    @item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :image, :price, :description, :user_id)
  end
end
