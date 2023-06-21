# frozen_string_literal: true

class Api::V1::GuestsController < Api::V1::BaseController
    def create
      # head :created
      guest = Guest.new(guest_params)
  
      if guest.save
        render json: { message: "Guest created successfully." }, status: :created
      else
        render json: { error: "Unable to create guest." }, status: :unprocessable_entity
    end
  end
  
    private
    def guest_params
      params.require(:guest).permit(:full_name, :phone_number)
    end
  end
  