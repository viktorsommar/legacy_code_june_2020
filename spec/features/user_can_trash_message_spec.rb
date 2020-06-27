require "rails_helper"

feature "User can trash and untrash messages" do
    let(:user) { FactoryBot.create(:user) }
    let(:sender) { FactoryBot.create(:user, name: 'Alex', email: 'sender@mail.com') }
    let(:receiver) { FactoryBot.create(:user, name: 'Sima', email: 'receiver@mail.com') }
    before do
        login_as(user, scope: :user)
        sender.send_message(receiver, 'Writing some text for test', 'Subject' )
        visit root_path
        click_on "Inbox"
    end

    context "User can trash message" do
        
        it 'should have 1 new message in the inbox' do
          count = receiver.mailbox.inbox.count
          expect(count).to eq 1
        end
    end
end