require 'spec_helper'

feature 'Signing in' do
  let :user do
    create(:user)
  end

  background do
    user.confirm!
    visit new_user_session_path
  end

  scenario 'signing in with valid email and password combination' do
    authenticate(user, capybara: true)

    current_path.should eq user_root_path
    page.should have_content("Hello, #{user.username}")
  end

  scenario 'signing in with valid username and password combination' do
    authenticate(user, capybara: true)

    current_path.should eq user_root_path
    page.should have_content("Hello, #{user.username}")
  end
end
