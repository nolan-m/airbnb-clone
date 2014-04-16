require 'spec_helper'

describe User do
  it { should have_many :properties }
  it { should have_many :reservations }
end
