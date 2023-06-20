class TentsController < ApplicationController
  before_action :set_tent, only: %i[show destroy]

  def index
    @tents = Tent.all
  end

  def show
    @tent = Tent.new(@tent)
  end

  def new
    @tent = Tent.new
  end

  def create
    @tent = Tent.new(tent_params)
    if @tent.save
      redirect_to tent_path(@tent)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tent.destroy
    redirect_to tent_path, status: :see_other
  end

  private

  def set_tent
    @tent = Tent.find(params[:id])
  end

  def tent_params
    params.require(:tent).permit(:name, :decription, :user_id, :address, :price)
  end
end
