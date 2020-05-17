class Api::V1::LocationsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_vehicle, only:[:create, :show]
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :new, only: [:create]
  def index
    render json: {message: "hola mundo"}
  end

  def create
    if Location.assign_new_location_to_vehicle(@location)
      render json: {status: 200}
    else
      render json: {errors: "Ocurrió un error al procesar la petición", status: :unprocessable_entity }
    end
  end

  def show
    render json: {vehicle: @vehicle}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:latitude, :longitude, :sent_at, :vehicle_identifier, :vehicle_id)
    end

    def new
      @location = {latitude: params[:latitude], longitude: params[:longitude], sent_at: params[:sent_at], vehicle_identifier: params[:vehicle_identifier]}
    end
    def set_vehicle
      @vehicle = Vehicle.find_by(identifier: params[:vehicle_identifier])
    end
end
