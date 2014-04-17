require 'spec_helper'

describe Rating do
  it { should belong_to :user }
  it { should belong_to :property }
  it { should belong_to :reservation }
  it { should validate_presence_of :score }
end
