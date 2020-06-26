require "rails_helper"

feature "User can trash messages" do
    before do
        create(conversation)
        visit mailbox_inbox_path
    end
end