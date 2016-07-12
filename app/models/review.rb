class Review < ActiveRecord::Base
  RATING = [
    [1, "1"],
    [2, "2"],
    [3, "3"],
    [4, "4"],
    [5, "5"]
  ].freeze
  belongs_to :zoo
  belongs_to :user

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5, message: 'Rating must be between 1 - 5' }
  validates :user_id, presence: true
  validates :zoo_id, presence: true

  def vote_up
    @zoo = Zoo.find(params[:zoo_id])
    @review = @zoo.find(params[:id])
    @vote = @review.vote
    @vote += 1
  end

  def vote_down
    @zoo = Zoo.find(params[:zoo_id])
    @review = @zoo.find(params[:id])
    @vote = @review.vote
    @vote -= 1
  end
end
