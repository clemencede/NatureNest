class TentsController < ApplicationController
  before_action :set_tent, only: %i[show destroy update edit]

  def index
    @query = params[:query]
    if @query.present?
      @tents = Tent.where("name ILIKE :query OR description ILIKE :query OR address ILIKE :query", query: "%#{@query}%")
    else
      @tents = Tent.all
    end
  end

  def show
    @user = @tent.user
  end

  def new
    @tent = Tent.new
  end

  def edit; end

  def update
    @tent.update!(tent_params)
    redirect_to tents_path
  end

  def create
    @tent = Tent.new(tent_params)
    @tent.user = current_user
    @tent.photo_url = "https://source.unsplash.com/random/?tent"
    # @tent.user = User.last
    if @tent.save!
      redirect_to tent_path(@tent)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tent.destroy
    redirect_to tents_path, status: :see_other
  end

  private

  def set_tent
    @tent = Tent.find(params[:id])
  end

  def tent_params
    params.require(:tent).permit(:name, :description, :user_id, :address, :photo_url, :price)
  end
end
