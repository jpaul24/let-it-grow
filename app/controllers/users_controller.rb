class UsersController < ApplicationController
  def show
    current_user
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:users).permit(:email, :username, :bio)
  end
end
