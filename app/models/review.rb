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
  has_many :votes

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5, message: 'Rating must be between 1 - 5' }
  validates :user_id, presence: true
  validates :zoo_id, presence: true

  def vote_count(review)
    count = 0
    if review.votes == [] || review.votes == nil
      return count
    else
      review.votes.each do |vote|
        if vote.up_vote == true
          count += 1
        elsif vote.down_vote == true
          count -= 1
        end
      end
    end
    return count
  end
end
