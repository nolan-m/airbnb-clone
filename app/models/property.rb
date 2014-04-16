class Property < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :city, :state, :price, presence: true
end
