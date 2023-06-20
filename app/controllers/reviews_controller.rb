class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @tent = Tent.find(params[:tent_id])
    @review.tent = @tent
    if @review.save
      redirect_to tent_path(@tent)
    else
      @booking = Booking.new
      render "tents/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to tent_path(@review.tent)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
