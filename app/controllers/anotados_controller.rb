class AnotadosController < ApplicationController

  def index
  end

  def show
    @anotado = Anotado.find(params[:id])
  end

	def new
    matches = Partido.all
    anotados = current_user.anotado_a.to_a
    @partidos = matches.to_a
    @partidos.delete_if {|partido| anotados.include?(partido)}
    @anotado = Anotado.new
  end

  def create
  	@anotado = Anotado.new(anotado_params)
  	if (@anotado.save)
  		render 'show'
		else
			render 'new'
		end

  end

  def aceptar
    anotado = Anotado.find_by!(user_id: params[:user_id], partido_id: params[:partido_id])
    anotado.aceptado = true
    anotado.save
    redirect_to Partido.find(params[:partido_id])
  end

  def quitar
    anotado = Anotado.find_by!(user_id: params[:user_id], partido_id: params[:partido_id])
    anotado.aceptado = false
    anotado.save
    redirect_to Partido.find(params[:partido_id])
  end

  private

  def anotado_params
  	params.require(:anotado).permit(:user_id, :partido_id)
  end
end
