class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # authorize @user
    @venues = @user.venues
    @venue = Venue.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      format.html { render :edit }
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo, :description)
  end
end
