require 'rails_helper'

describe "signing up" do
  it "signs a user up when provided correct information" do
    visit '/'
    signup('butterscotch@yahoo.com', 'mushroompizza','mushroompizza')
    expect(page).to have_content "Logged in as butterscotch@yahoo.com"
  end

  it "logs a user in when provided correct information" do
    user = FactoryGirl.create(:user)
    login('me@me.com', '12345678')
    expect(page).to have_content "Logged in as me@me.com"
  end

  it "does not sign a user up when provided incorrect information" do
    visit '/'
    signup('butterscotch@yahoo.com', 'mushroompizza', 'mushroooooompizza')
    expect(page).to have_content "error"
  end

  it "does not log a user in when provided incorrect password" do
    user = FactoryGirl.create(:user)
    login('me@me.com','12345679')
    expect(page).to have_content "Invalid"
  end


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
