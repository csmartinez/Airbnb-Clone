require 'rails_helper'

describe Room do
  it { should have_many(:users).through(:reservations) }
end
