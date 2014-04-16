require 'spec_helper'

describe Reservation do
  it { should belong_to :user }
  it { should belong_to :property }
  describe 'block_out' do
    it 'should not allow users to make a reservation during block_out period' do
      user = FactoryGirl.create(:user)
      property = FactoryGirl.create(:property)
      reservation = Reservation.create(:user_id => user.id, :property_id => property.id, :start_date => 'April 16, 2014', :end_date => 'April 20, 2014')
      reservation_dos = Reservation.create(:user_id => user.id, :property_id => property.id, :start_date => 'April 17, 2014', :end_date => 'April 18, 2014')
      reservation_dos.save.should eq false
    end
  end
end
