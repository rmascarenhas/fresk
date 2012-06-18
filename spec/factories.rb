FactoryGirl.define do
  factory :user do
    name 'Test'
    sequence(:username) { |n| "username_#{n}" }
    email { "#{username}@example.com" }
    password 'abc123'
    avatar File.open(File.join(Rails.root, 'spec/assets/test_avatar.jpg'))
  end
end
