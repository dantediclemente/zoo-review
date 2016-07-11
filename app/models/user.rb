class User < ActiveRecord::Base
  has_many :reviews
  has_many :zoos

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true, presence: true
  validates :encrypted_password, presence: true

  def admin?
    role == "admin"
  end
end
