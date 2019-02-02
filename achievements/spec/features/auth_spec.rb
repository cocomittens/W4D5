require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    
  scenario 'has a new user page' do
    visit new_user_path
    expect(page).to have_content("signup")
  end
    
  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
        input_user = FactoryBot.build(:user)
        fill_in 'username', with: input_user.username
        click_button "signup"
        expect(current_path).to eq(User.last)
        expect(page).to have_content(input_user.username)
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do

  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do

  end

  scenario 'doesn\'t show username on the homepage after logout' do

  end
end
