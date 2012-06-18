FactoryGirl.define do
  factory :user do
    name 'Test'
    sequence(:username) { |n| "username_#{n}" }
    email { "#{username}@example.com" }
    password 'abc123'
    avatar File.open(File.join(Rails.root, 'spec/assets/test_avatar.jpg'))
  end

  factory :task_list do
    sequence(:name) { |n| "task_list_#{n}" }
    owner factory: :user

    factory :private_task_list do
      public false
    end
  end
end
