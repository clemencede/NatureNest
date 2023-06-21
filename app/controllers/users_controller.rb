class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.profilepic = "https://source.unsplash.com/random/?person"
    @user = User.last
    if @user.save!
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tent_params
    params.require(:user).permit(:first_name, :email, :password, :profilepic)
  end
end
