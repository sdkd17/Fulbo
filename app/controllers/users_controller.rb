class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		if(@user.save)
			log_in @user
			redirect_to :action => 'show', :id => @user.id
		else
			render 'new'
		end
	end

	def update
	end

	def destroy
		
	end
	

	private
		
		def user_params
			params.require(:user).permit(:nick, :password, :password_confirmation, 
																	 :nombre, :apellido, :nacimiento, :email, 
																	 :descripcion, :avatar)
		end

end
