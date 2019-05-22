class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @venue = Venue.new
    @venues = Venue.first(3)
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
    params.require(:venue).permit(:name, :location, :category, :description)
  end
end
