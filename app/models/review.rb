class Review < ActiveRecord::Base
  belongs_to :zoo
  belongs_to :user

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5, message: 'Rating must be between 1 - 5' }
  validates :user_id, presence: true
  validates :zoo_id, presence: true
end
