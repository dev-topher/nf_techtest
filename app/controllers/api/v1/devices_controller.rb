module Api
  module V1
    class DevicesController < ApplicationController
      before_action :set_device, only: %i[show edit update destroy]
      skip_before_action :verify_authenticity_token
      
      # GET /api/v1/devices
      def index
        @devices = Device.includes(:restaurant)
        render json: @devices, include: :restaurant
      end
  
      # GET /api/v1/devices/1
      def show
        render json: @device, include: :restaurant
      end
  
      # POST /api/v1/devices
      def create
        @device = Device.new(device_params)
  
        if @device.save
          render json: @device, status: :created
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /api/v1/devices/1
      def update
        if @device.update(device_params)
          render json: @device
        else
          render json: @device.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /api/v1/devices/1
      def destroy
        @device.destroy
        head :no_content
      end
  
      private
  
      def set_device
        @device = Device.find(params[:id])
      end
  
      def device_params
        params.require(:device).permit(:name, :status, :restaurant_id)
      end
    end
  end
end