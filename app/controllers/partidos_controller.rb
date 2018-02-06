class PartidosController < ApplicationController
  
  before_action :require_player_login, only: [:new, :create]

  def index
  	todos = Partido.all
    @partidos = []
     
    if logged_in?
      todos.each do |partido|
        if current_user.following.include?(User.find(partido.user_id)) 
          #hacer esto sin que consulte a la basepara encontrar el usuario
          @partidos << partido
        end
      end
    end
  end

  def show
    @partido = Partido.find(params[:id])
    @anotado = nil
    # debugger

    unless @partido.anotados.include?(Anotado.find_by({partido_id: @partido.id, user_id: current_user.id}))
      @anotado = Anotado.new
    end
  end

  def new
  	@partido = Partido.new
    @local_names = Local.all.pluck(:nombre)
  end

  def create
  	@user = User.find(partido_params[:user_id])
  	@partido = @user.partidos.build(partido_params)
  	if(@partido.save)
      Anotado.create(user_id: @user.id, partido_id: @partido.id)
  		render 'show'
  	else
  		render 'new'
  	end
  end

  private
  	def partido_params
  		params.require(:partido).permit(:user_id, :lugar, :fecha)
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
