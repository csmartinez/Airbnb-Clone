require 'rails_helper'

describe "signing up" do
  it "signs a user up when provided correct information" do
  visit '/'
  click_on 'Sign up'
  fill_in 'Email', :with => 'butterscotch@yahoo.com'
  fill_in 'Password', :with => 'mushroompizza'
  fill_in 'Password confirmation', :with => 'mushroompizza'
  click_button 'Sign up'
  expect(page).to have_content "Logged in as butterscotch@yahoo.com"
  end
end
