class ReservationController < ApplicationController
  
  before_action :require_player_login


  def index
  end

  def new
    @reservation = Reservation.new
    @locals = Local.all.pluck(:id, :nombre)
    # @partidos = current_user.partidos.pluck(:id, :lugar, :fecha)
  end

  def create

  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

    def reservation_params
      params.require(:reservation).permit(:user_id, :partido_id, :local_id, :court_id, :fecha)
    end

    def require_player_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to '/login'
      end
      if current_user.local_owner?
        render 'static_pages/error_tipo_usuario'
      end
    end

end
