class CourtsController < ApplicationController
  def new
  end

  def create
  	@court = Court.new(court_params)
  	
  	@court.save
	
		redirect_to Local.find(court_params[:local_id])

  end

  def destroy
  end

  private

  def court_params
  	params.require(:court).permit(:local_id, :precio, :court_type)
  end
end
