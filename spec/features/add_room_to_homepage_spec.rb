require 'rails_helper'

describe "signing up" do
  it "allows you to add a room when successfully logged in" do
    user = FactoryGirl.create(:user)
    login('me@me.com', '12345678')
    add_room('big', 'toaster', 'downtown')
    expect(page).to have_content "downtown"
  end
end

def add_room(size, amenities, location)
  visit '/'
  fill_in 'Size', :with => size
  fill_in 'Amenities', :with => amenities
  fill_in 'Location', :with => location
  click_button 'Add room'
end

def login(email, password)
  visit '/'
  click_on 'Login'
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  click_button 'Log in'
end

def signup(email, password, password_confirmation)
  click_on 'Sign up'
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  fill_in 'Password confirmation', :with => password_confirmation
  click_button 'Sign up'
end
