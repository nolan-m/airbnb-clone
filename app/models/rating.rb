class Rating < ActiveRecord::Base

  belongs_to :property
  belongs_to :user
  belongs_to :reservation

  validates :score, presence: true

end
