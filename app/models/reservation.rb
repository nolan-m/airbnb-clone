class Reservation < ActiveRecord::Base
  validates :end_date, :start_date, presence: :true
  belongs_to :user
  belongs_to :property



  after_create :reservation_message

  def reservation_message
    UserMailer.reservation_confirmation(self).deliver
  end
end
