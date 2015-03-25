require 'rails_helper'

feature 'User signs up', %Q{
As a user
I want to sign in
So that my questions and answers can be associated to me.
} do

  scenario 'user provides valid information' do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Parmesan"
    fill_in "Email", with: "pparmasean@privateeyes.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "supersecret"
    click_on "Sign up"
    
    expect(page).to have_content "Welcome! You have signed up successfully."

  end
end
