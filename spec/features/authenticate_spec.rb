require 'rails_helper'

describe "signing up" do
  it "signs a user up when provided correct information" do
    visit '/'
    signup('butterscotch@yahoo.com', 'mushroompizza','mushroompizza')
    expect(page).to have_content "Logged in as butterscotch@yahoo.com"
  end

  it "logs a user in when provided correct information" do
    user = FactoryGirl.create(:user)
    login
    expect(page).to have_content "Logged in as me@me.com"
  end

  it "does not sign a user up when provided incorrect information" do
    visit '/'
    signup('butterscotch@yahoo.com', 'mushroompizza', 'mushroooooompizza')
    expect(page).to have_content "error"
  end

  it "does not log a user in when provided incorrect password" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'me@me.com'
    fill_in 'Password', :with => '12345679'
    click_button 'Log in'
    expect(page).to have_content "Invalid"
  end

  it "allows you to add a room when successfully logged in" do
    user = FactoryGirl.create(:user)
    login
    fill_in 'Size', :with => 'big'
    fill_in 'Amenities', :with => 'stuff'
    fill_in 'Location', :with => 'downtown'
    click_button 'Add room'
    expect(page).to have_content "downtown"
  end
end


  def login
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'me@me.com'
    fill_in 'Password', :with => '12345678'
    click_button 'Log in'
  end

  def signup(email, password, password_confirmation)
    click_on 'Sign up'
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    fill_in 'Password confirmation', :with => password_confirmation
    click_button 'Sign up'
  end
