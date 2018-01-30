class LocalsController < ApplicationController

	def new
		@local = Local.new
	end

	def create
		@local = Local.new(local_params)
		if @local.save
			render 'show'
		else
			render 'new'
		end
	end

	def show
		@local = Local.find(params[:id])
	end

	def edit

	end

	def destroy
	end

	
	private

		def local_params
			params.require(:local).permit(:barrio, :direccion, :telefono, :email,
																		:opens, :closes)
		end

end
