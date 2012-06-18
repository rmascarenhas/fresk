# +AuthenticationHelpers+ module provides a few helper methods for the app
# authentication, easing the process of getting user-level privileges and
# signing in as a particular user.
#
module AuthenticationHelpers

  # Authenticates a given user or an anonymous one, created by factory_girl
  # if no argument is passed
  #
  def authenticate(as=nil)
    @user = as
    user.confirm!

    Capybara.reset_sessions!
    visit new_user_session_path

    fill_in 'user_login', with: user.username
    fill_in 'user_password', with: user.password

    click_button 'Sign in'
    sleep 3
  end

  private

  def user
    @user ||= create(:user)
  end
end
