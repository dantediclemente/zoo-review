class VotesController < ApplicationController
  before_action :login_user, :set_params

  skip_before_action :verify_authenticity_token

  def create
    @vote = Vote.where(user: current_user, review: @review).first

    if @vote.nil?
      @vote = Vote.new(review: @review, value: @value)
      @vote.user = current_user
    elsif @vote.value == params[:value].to_i
      @vote.value = 0
    else
      @vote.value = params[:value].to_i
    end
    if @vote.save
      @review.update_attributes(vote_total: @review.votes_total)
      @review.save
      redirect_to :back
      # render json: { vote_total: @review.votes_total, review_id: @review.id }
    else
      flash[:error] = 'Something went wrong with your request.'
      redirect_to :back
    end
  end
  private

  def set_params
    @review = Review.find(params[:review_id])
    @value = params[:value]
  end

  def login_user
    unless user_signed_in?
      flash[:error] = 'You must be signed in to vote.'
      redirect_to new_user_session_path
    end
  end
end
