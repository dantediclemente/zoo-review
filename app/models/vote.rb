class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :up_vote, inclusion: { in: [true, false] }
  validates :up_vote, exclusion: { in: [nil] }
  validates :down_vote, inclusion: { in: [true, false] }
  validates :down_vote, exclusion: { in: [nil] }
end
