class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @tent = Tent.find(params[:tent_id])
    @review.tent = @tent
    @review.user = current_user
    @review.save
    redirect_to tent_path(@tent)
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
