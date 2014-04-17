require 'spec_helper'

describe User do
  it { should have_many :properties }
  it { should have_many :reservations }
  it { should have_many :ratings }

  describe '.upcoming' do
    it 'should return upcoming reservations' do
      user = FactoryGirl.create(:user)
      property = FactoryGirl.create(:property)
      reservation = Reservation.create(:user_id => user.id, :property_id => property.id, :start_date => 'April 12, 2014', :end_date => 'April 14, 2014')
      reservation_dos = Reservation.create(:user_id => user.id, :property_id => property.id, :start_date => 'April 20, 2014', :end_date => 'April 25, 2014')
      user.upcoming.should eq [reservation_dos]
    end
  end

  describe '.past' do
    it 'should return past reservations' do
      user = FactoryGirl.create(:user)
      property = FactoryGirl.create(:property)
      reservation = Reservation.create(:user_id => user.id, :property_id => property.id, :start_date => 'April 12, 2014', :end_date => 'April 14, 2014')
      reservation_dos = Reservation.create(:user_id => user.id, :property_id => property.id, :start_date => 'April 20, 2014', :end_date => 'April 25, 2014')
      user.past.should eq [reservation]
    end
  end
end
