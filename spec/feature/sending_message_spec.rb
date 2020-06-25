require "rails_helper"

feature 'User can send a message' do
    context 'Compose a message'
    before do
        create(:user, email: 'user@mail.com', password: '12345678', name: 'Alex')
        visit root_path
        click_on 'Login'
        fill_in "Email", :with => "user@mail.com"
        fill_in "Password", :with => "12345678"
        click_on "Log in"
        click_on "Inbox"
        click_on "Compose"
        select "Alex", :from => "Recipients"
        fill_in "Subject", :with => "Test"
        fill_in "Message", :with => "This is a test message.", visible: false
        click_on "Send Message"
    end

    it 'user can send a message' do
        expect(page).to have_content 'Your message was successfully sent!'
    end
end