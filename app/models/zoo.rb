class Zoo < ActiveRecord::Base

  STATES = [
   ["Alabama", "AL"],
   ["Alaska", "AK"],
   ["Arizona", "AZ"],
   ["Arkansas", "AR"],
   ["California", "CA"],
   ["Colorado", "CO"],
   ["Connecticut", "CT"],
   ["Delaware", "DE"],
   ["Florida", "FL"],
   ["Georgia", "GA"],
   ["Hawaii", "HI"],
   ["Idaho", "ID"],
   ["Illinois", "IL"],
   ["Indiana", "IN"],
   ["Iowa", "IA"],
   ["Kansas", "KS"],
   ["Kentucky", "KY"],
   ["Loisiana", "LA"],
   ["Maine", "ME"],
   ["Maryland", "MD"],
   ["Massachesetts", "MA"],
   ["Michigan", "MI"],
   ["Minnesota", "MN"],
   ["Mississipi", "MS"],
   ["Missouri", "MO"],
   ["Montana", "MT"],
   ["Nebraska", "NE"],
   ["Nevada", "NV"],
   ["New Hempshire", "NH"],
   ["New Jersey", "NJ"],
   ["New Mexico", "NM"],
   ["New York", "NY"],
   ["North Carolina", "NC"],
   ["North Dakota", "ND"],
   ["Ohio", "OH"],
   ["Oklahoma", "OK"],
   ["Oregon", "OR"],
   ["Pennsylvania", "PA"],
   ["Rhode Island", "RI"],
   ["South Carolina", "SC"],
   ["South Dakota", "SD"],
   ["Tennessee", "TN"],
   ["Texas", "TX"],
   ["Utah", "UT"],
   ["Vermont", "VT"],
   ["Virginia", "VA"],
   ["Washington", "WA"],
   ["West Virginia", "WV"],
   ["Wisconsin", "WI"],
   ["Wyoming", "WY"]
  ]

  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :zip, length: { is: 5 }
  validates :zip, numericality: { only_integer: true }
  validates :user_id, presence: true
end
