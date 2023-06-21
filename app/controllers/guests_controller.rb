class GuestsController < ApplicationController
  before_action :set_guest, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  # GET /guests or /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1 or /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests or /guests.json
  def create
    @guest = Guest.new(guest_params)
    # unless params[:guest].present?
    #   render json: { error: "Guest parameter is missing" }, status: :unprocessable_entity
    #   return
    # end

    if @guest.save
      render json: { message: 'Guest created successfully' }, status: :created
    else
      render json: { errors: @guest.errors.full_messages }, status: :bad_request
    end
    # respond_to do |format|
    #   if @guest.save
    #     # format.html { redirect_to guest_url(@guest), notice: "Guest was successfully created." }
    #     # format.json { render :show, status: :created, location: @guest }
    #     # format.html { render json: { guest: @guest }, status: :created }
    #     render json: { message: 'Guest created successfully' }, status: :created
    #     # format.json { render json: { guest: @guest }, status: :created }

    #   else
    #     format.html { render :new, status: :bad_request }
    #     format.json { render json: @guest.errors, status: :bad_request }
    #   end
    # end
  end

  # PATCH/PUT /guests/1 or /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to guest_url(@guest), notice: "Guest was successfully updated." }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit, status: :bad_request }
        format.json { render json: @guest.errors, status: :bad_request }
      end
    end
  end

  # DELETE /guests/1 or /guests/1.json
  def destroy
    @guest.destroy

    respond_to do |format|
      format.html { redirect_to guests_url, notice: "Guest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.fetch(:guest, {}).permit(:full_name, :phone_number)      
      #OG line: params.require(:guest).permit(:full_name, :phone_number)
    end
end
