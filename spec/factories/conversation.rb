FactoryBot.define do
    factory :conversation do
      recipient { 'Name' }
      subject { 'MyString' }
      body { 'MyText' }
    end
  end