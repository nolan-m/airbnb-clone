class Reservation < ActiveRecord::Base
  validates :end_date, :start_date, presence: :true
  belongs_to :user
  belongs_to :property
  after_create :reservation_message
  before_create :block_out


  def block_out
    current_reservations = Reservation.where(:property_id => self.property_id)
    current_reservations.each do |reservation|
      if self.start_date < reservation.end_date && self.end_date > reservation.start_date && self.end_date < reservation.end_date && self.end_date > reservation.start_date
        return false
      end
    end
  end

  def reservation_message
    UserMailer.reservation_confirmation(self).deliver
  end

end
