class PartidosController < ApplicationController
  
  before_action :require_player_login, only: [:new, :create]

  def index
  	todos = Partido.all
    @partidos = []
     
    if logged_in?
      todos.each do |partido|
        if current_user.following.include?(User.find(partido.user_id)) 
          #hacer esto sin que consulte a la base para encontrar el usuario
          @partidos << partido
        end
      end
    end
  end

  def show
    @partido = Partido.find(params[:id])
    @anotado = nil
    unless @partido.anotados.include?(Anotado.find_by({partido_id: @partido.id, user_id: current_user.id}))
      @anotado = Anotado.new
    end
  end

  def new
  	@partido = Partido.new
    @locals = Local.all.pluck(:id, :nombre)
  end

  def create
    fecha = DateTime.new(partido_params["fecha(1i)"].to_i, partido_params["fecha(2i)"].to_i,
                        partido_params["fecha(3i)"].to_i, partido_params["fecha(4i)"].to_i,0,0)
    if fecha >= Date.today
      local_id = partido_params[:local_id]
      court_id = partido_params[:court_id]
    
      @error_fecha = false
      @partido = Partido.new
      @locals = Local.all.pluck(:id, :nombre)

      #verifico si ya existe un partdo para local y cancha a la misma hora
       # debugger
      if Partido.where("local_id = ? AND court_id = ? AND fecha = ?",local_id, court_id, fecha).empty?
        @user = User.find(partido_params[:user_id])
        @partido = @user.partidos.build(partido_params)
        if(@partido.save)
          Anotado.create(user_id: @user.id, partido_id: @partido.id)
          render 'show'
        else
          render 'new'
        end
      else
        @error_fecha = true;
        render 'new'
      end
    else
      @partido = Partido.new
      @locals = Local.all.pluck(:id, :nombre)
      @error_fecha = true;
      render 'new'
    end
  end

  def armar
    partido = Partido.find(params[:id])
    @equipo1 = Array.new
    @equipo2 = Array.new
    
    if partido.aceptados.length == 10
      for i in 0..4
        @equipo1 << partido.aceptados[i]
      end 
      for i in 5..9
        @equipo2 << partido.aceptados[i]
      end
    else
      @error_cant_aceptados = true
    end

    respond_to do |format|
      format.html
      format.js 
    end
  end
  private
  	def partido_params
  		params.require(:partido).permit(:user_id, :local_id, :court_id, :fecha)
  	end

    def require_player_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to '/login'
        return
      end
      if current_user.local_owner?
        render 'static_pages/error_tipo_usuario'
      end
    end
end
