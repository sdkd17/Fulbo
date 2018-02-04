class LocalsController < ApplicationController

	def new
		@local = Local.new
	end

	def create
		@local = Local.new(local_params)
		@court = Court.new
		if @local.save
			render 'show'
		else
			render 'new'
		end
	end

	def show
		@local = Local.find(params[:id])
		@court = Court.new
	end

	def edit
		@local = Local.find(params[:id])
	end

	def update
		@local = Local.find(params[:id])
		if @local.update_attributes(local_params)
			render 'show'
		else
			render 'edit'
		end
	end

	def destroy
	end

	
	private

		def local_params
			params.require(:local).permit(:nombre, :barrio, :direccion, :telefono, :email,
																		:opens, :closes)
		end

end
