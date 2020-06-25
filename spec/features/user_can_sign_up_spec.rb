require "rails_helper"

feature 'User can sign up' do
    context 'User needs to sign up to use the app' do
        before do
            visit root_path
            click_on 'Sign up'
    end

    it 'shows a sign up button' do
        expect(page).to have_link 'Sign up'
    end

    it 'user can access sign up page' do
        expect(page).to eq new_user_registration_path
    end
    
end
end