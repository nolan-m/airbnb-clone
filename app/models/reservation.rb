class Reservation < ActiveRecord::Base
  validates :end_date, :start_date, presence: :true
end
