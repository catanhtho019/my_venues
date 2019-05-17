class UsersController < ApplicationController
  def show
    @user = current_user.email
  end
end
