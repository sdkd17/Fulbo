class PartidosController < ApplicationController
  
  def index
  	@partidos = Partido.all
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
