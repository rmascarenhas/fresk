feature 'Signing up' do
  background do
    visit root_path
    click_link 'Sign Up'
  end

  scenario 'Signing up with valid information' do
    user     = build(:user)
    password = user.password

    fill_in 'user_name',                  with: user.name
    fill_in 'user_username',              with: user.username
    fill_in 'user_email',                 with: user.email
    fill_in 'user_password',              with: user.password
    fill_in 'user_password_confirmation', with: user.password

    attach_file 'user_avatar', File.join(Rails.root, 'spec/assets/test_avatar.jpg')
    click_button 'Sign up'

    current_path.should eq root_path

    user = User.where(username: user.username).first
    user.password = password
    user.confirm!
    
    authenticate(user)
    current_path.should eq user_root_path
  end
end
