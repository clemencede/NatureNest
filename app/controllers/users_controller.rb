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

  def update
    raise
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User information updated successfully."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :password, :profilepic, :last_name, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
