# +AuthenticationHelpers+ module provides a few helper methods for the app
# authentication, easing the process of getting user-level privileges and
# signing in as a particular user.
#
module AuthenticationHelpers

  include Warden::Test::Helpers
  Warden.test_mode!

  # Authenticates a given user or an anonymous one, created by factory_girl
  # if no argument is passed.
  #
  # A second argument may be passed, and if it contains the +:capybara+
  # option, authentication will be made by filling the sign in page.
  #
  def authenticate(as=nil, options={})
    @user = as
    user.confirm!
    
    Capybara.reset_sessions!

    if options[:capybara]
      fill_in_sign_in_form
    else
      login_as(user, scope: :user)
      visit user_root_path
    end
  end

  private

  def user
    @user ||= create(:user)
  end

  def fill_in_sign_in_form
    visit new_user_session_path

    fill_in 'user_login', with: user.username
    fill_in 'user_password', with: user.password

    click_button 'Sign in'
  end
end
