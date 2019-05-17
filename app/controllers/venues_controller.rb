class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    # @booking = Booking.new
    # @review = Review.new
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render 'new'
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :type, :description)
  end
end
