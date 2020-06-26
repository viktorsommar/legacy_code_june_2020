require "rails_helper"

feature "User can trash messages" do
    before do
        create(:user, email: 'user@mail.com', password: '12345678', name: 'Alex')
        create(:user, email: 'user2@mail.com', password: '12345678', name: 'Sima')
        create(:conversation, recipient: 'Sima', subject: 'Hello', body: 'Hello there Alex')
        visit mailbox_inbox_path
    end

    it 'User can see message in inbox' do
        expect(page).to have_content 'View'
    end
end