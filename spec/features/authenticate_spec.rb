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

  it "logs a user in when provided correct information" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'me@me.com'
    fill_in 'Password', :with => '12345678'
    click_button 'Log in'
    expect(page).to have_content "Logged in as me@me.com"
  end

  it "does not sign a user up when provided incorrect information" do
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', :with => 'butterscotch@yahoo.com'
    fill_in 'Password', :with => 'mushroompizza'
    fill_in 'Password confirmation', :with => 'mushroooooompizza'
    click_button 'Sign up'
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
end
