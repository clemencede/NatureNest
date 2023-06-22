class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

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

  def show; end

  private

  def tent_params
    params.require(:user).permit(:first_name, :email, :password, :profilepic)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
