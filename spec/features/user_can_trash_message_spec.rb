require "rails_helper"

feature "User can trash and untrash messages" do
    context "Sender can send message and receiver trashes it" do
    let(:user1) { create(:user, name: 'Alex', email: 'sender@mail.com') }
    let(:user2) { create(:user, name: 'Sima', email: 'receiver@mail.com') }
    before do
        @message = user1.send_message(user2, 'Writing some text for test', 'Subject' )
        login_as(user2, scope: :user)
        visit conversation_path(@message.notification_id)
        click_on "Move to trash"
    end

        it 'should have 1 message in the trash' do
            count = user2.mailbox.trash.count
            expect(count).to eq 1
        end

        it "receiver untrashes the message" do
            visit conversation_path(@message.notification_id)
            click_on "Untrash"
            visit mailbox_inbox_path
            count = user2.mailbox.inbox.count
            expect(count).to eq 1
        end
    end
end