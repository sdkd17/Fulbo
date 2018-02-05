class CourtsController < ApplicationController
  def new
  end

  def create
    params[:courts_number].to_i.times do |i|
      @court = Court.new(court_params)
    
      @court.save  
    end
  
  	
		redirect_to Local.find(court_params[:local_id])

  end

  def destroy
  end

  private

  def court_params
  	params.require(:court).permit(:local_id, :precio, :court_type)
  end
end
