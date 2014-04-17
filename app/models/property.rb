class Property < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :ratings
  has_many :pictures

  validates :title, :description, :city, :state, :price, presence: true


end
