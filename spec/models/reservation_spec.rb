require 'spec_helper'

describe Reservation do
  it { should belong_to :user }
  it { should belong_to :property }
end
