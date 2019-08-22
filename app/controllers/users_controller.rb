class UsersController < ApplicationController
  def show
    current_user
    authorize current_user
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :bio, :photo)
  end
end
