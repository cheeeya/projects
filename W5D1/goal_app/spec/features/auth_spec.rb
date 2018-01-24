require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New User'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: "douglas"
      fill_in 'password', with: "password"
      click_on 'Sign Up'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content "douglas"
    end

  end
end

feature 'logging in' do
  let!(:user){ FactoryBot.create(:user, username: "douglas", password: "password")}
  before(:each) do
    visit new_session_url
    fill_in 'username', with: "douglas"
    fill_in 'password', with: "password"
    click_on 'Log in'
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content "douglas"
  end
end

feature 'logging out' do
  before(:each) do
    visit new_session_url
  end
  context 'before logging in' do
    scenario 'begins with a logged out state' do
      expect(page).not_to have_button 'Logout'
    end
  end

  context 'after logging in' do
    let!(:user){ FactoryBot.create(:user, username: "douglas", password: "password")}
    before(:each) do
      fill_in 'username', with: 'douglas'
      fill_in 'password', with: 'password'
      click_on 'Log in'
      click_on 'Logout'
    end
    scenario 'doesn\'t show username on the homepage after logout' do
      expect(page).not_to have_content('douglas')
    end
  end
end
