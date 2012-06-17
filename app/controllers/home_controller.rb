class HomeController < ApplicationController

  def index
    redirect_to user_root_path if user_signed_in?
  end

  def not_found
  end

end
