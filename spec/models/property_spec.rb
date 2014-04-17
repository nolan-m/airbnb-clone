require 'spec_helper'

describe Property do
  it { should belong_to :user }
  it { should have_many :reservations }
  it { should have_many :ratings }
  it { should have_many :pictures }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :price }
end
