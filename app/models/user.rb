class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :properties
  has_many :reservations
  has_many :ratings
  has_attached_file :avatar, :styles => { small: "100x100>", medium: "250x250#" }

  validates_attachment_content_type :avatar, :content_type =>
  ["image/jpg", "image/jpeg", "image/png"]

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end

  def upcoming
    upcoming = []
    self.reservations.each do |reservation|
      if reservation.start_date > Time.now
        upcoming << reservation
      end
    end
    upcoming
  end

  def past
    upcoming = []
    self.reservations.each do |reservation|
      if reservation.start_date < Time.now
        upcoming << reservation
      end
    end
    upcoming
  end
end
