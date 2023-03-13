class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @musician = Musician.find(params[:musician_id])
    @review.musician = @musician
    @review.user = current_user

    if @review.save
      redirect_to musician_path(@musician)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to musician_path(@musician.list)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
