class PartidosController < ApplicationController
  
  def index
  	todos = Partido.all
    @partidos = []
     #debugger
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
  end

  def new
  	@partido = Partido.new
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
end
