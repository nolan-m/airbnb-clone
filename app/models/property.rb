class Property < ActiveRecord::Base
  belongs_to :user
  has_many :reservations

  validates :title, :description, :city, :state, :price, presence: true


end
