module Users

  class UsersController < ApplicationController
    before_filter :authorize_user!
  end

end
