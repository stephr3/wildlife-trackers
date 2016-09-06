require 'rails_helper'

describe Sighting do
  it { should validate_presence_of :description }
  it { should validate_presence_of :date }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
  it { should belong_to :animal }
end
