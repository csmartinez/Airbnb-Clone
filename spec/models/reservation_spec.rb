require 'rails_helper'

describe Reservation do
  it { should belong_to(:room) }
  it { should belong_to(:user) }
end
