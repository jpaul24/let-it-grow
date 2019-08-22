class UsersController < ApplicationController
  def show
    current_user
    authorize current_user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    current_user.update(user_params)
    @user = current_user
    authorize @user
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :bio, :photo)
  end
end
