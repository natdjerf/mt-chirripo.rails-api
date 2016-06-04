class ReservationsController < OpenReadController
  before_action :set_reservation, only: [:show, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all

    render json: @reservations
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    render json: @reservation
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = current_user.reservations.new(reservation_params.merge(user_id: params[:user_id]))

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(reservation_params)
      render json: @reservation, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy

    head :no_content
  end

  private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:permit_quantity, :lodging_quantity, :permit_start_date, :permit_end_date, :total_cost)
    end
end
