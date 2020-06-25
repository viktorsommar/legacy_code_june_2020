require "rails_helper"

feature 'User can sign up' do
  context 'User needs to sign up to use the app' do
    before do
      visit root_path
      click_on 'Sign up'
      fill_in 'Name', with: 'Pontus'
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
    end

    it 'shows a sign up button' do
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end 
  end
end