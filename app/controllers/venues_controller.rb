class VenuesController < ApplicationController
  def index
    @venues = Venue.where("location ILIKE '%#{params[:location]}%'")

    @venues = Venue.where.not(latitude: nil, longitude: nil)

    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude
      }
    end
  end

  def show
    # @venue = Venue.find(params[:id])
    set_venue
    @booking = Booking.new
    @checkin = params['checkin_on']
    @checkout = params['checkout_on']
    if ((!@checkin.blank?) && (!@checkout.blank?))
      from = @checkin.split("/")
      to = @checkout.split("/")
      start = Date.new(from[2].to_f, from[1].to_f - 1, from[0].to_f)
      finish = Date.new(to[2].to_f, to[1].to_f - 1, to[0].to_f)
      @nb_days = (finish - start).to_f
      @total_price = (@nb_days * @venue.price.to_f).round
    end
    @venue = Venue.find(params[:id])
    @bookings = @venue.bookings
  end

  def new
    @venue = Venue.new
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue), notice: 'Venue was successfully added.'
    else
      render 'new'
    end
  end

  def update
    set_venue
    if @venue.update(venue_params)
      redirect_to @venue, notice: 'Venue was successfully updated.'
    else
      format.html { render :edit }
    end
  end

  def destroy
    set_venue
    @venue.destroy
    redirect_to root_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :post_code, :category, :description, :price, :photo)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end
end
