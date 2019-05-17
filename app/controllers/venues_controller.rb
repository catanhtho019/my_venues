class VenuesController < ApplicationController
  def index
    @venues = Venue.where("location ILIKE '%#{params[:location]}%'")

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
      redirect_to venue_path(@venue), notice: 'Venue was successfully added.'
    else
      render 'new'
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])

      if @venue.update(venue_params)
        redirect_to @venue, notice: 'Venue was successfully updated.'
      else
        format.html { render :edit }
      end
    end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :type, :description)
  end
end
