class UsersController < ApplicationController
  def show
    @user = current_user.email
  end

  def article_params
    params.require(:article).permit(:title, :body, :photo)
  end
end
