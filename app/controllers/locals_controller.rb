class LocalsController < ApplicationController

	#before_action :require_owner_login 

	def index
		@locals = Local.all
	end

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

	def canchas
		@local = Local.find(params[:id])
		@canchas = @local.courts.length
		# debugger
		render :partial => 'canchas'
	end

	def destroy
	end

	private

		def local_params
			params.require(:local).permit(:nombre, :barrio, :direccion, :telefono, :email,
																		:opens, :closes, :user_id)
		end

		def require_owner_login
			unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to '/login'
        return
      end
      if current_user.player?
        render 'static_pages/error_tipo_usuario'
      end
		end
end
