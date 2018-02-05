class CourtsController < ApplicationController
  def new
  end

  def create
    debugger
    courts_number = params[:courts_number]
    if courts_number == 0
      @court = Court.new(court_params)
      @court.save  
    else
      params[:courts_number].to_i.times do |i|
        @court = Court.new(court_params)
        @court.save  
      end
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
