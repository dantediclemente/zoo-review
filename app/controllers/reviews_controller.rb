class ReviewsController < ApplicationController
  def create
    @zoo = Zoo.find(params[:zoo_id])
    @review = Review.new(review_params)
    @review.zoo = @zoo
    @review.user = current_user
    @rating_collection = Review::RATING

    if @review.save
      flash[:notice] = "Review created successfully"
      redirect_to zoo_path(@zoo)
    else
      flash[:errors] = @review.errors.full_messages.join(", ")
      render :'zoos/show'
    end
  end

  def edit
    @zoo = Zoo.find(params[:zoo_id])
    @review = @zoo.reviews.find(params[:id])
    @rating_collection = Review::RATING
  end

  def update
    @zoo = Zoo.find(params[:zoo_id])
    @review = @zoo.reviews.find(params[:id])
    @rating_collection = Review::RATING
    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated successfully"
      redirect_to zoo_path(@zoo)
    else
      flash[:errors] = @review.errors.full_messages.join(",")
      render :edit
    end
  end

  def destroy
    @zoo = Zoo.find(params[:zoo_id])
    @review = @zoo.reviews.find(params[:id])
    @review.destroy
    flash[:notice] = "Review deleted successfully"
    redirect_to zoo_path(@zoo)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
