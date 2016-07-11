class ReviewsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

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

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
