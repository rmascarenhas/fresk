require 'fresk_responder'

class ApplicationController < ActionController::Base
  self.responder = FreskResponder
  respond_to :html

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  protect_from_forgery

  # Handles the case of attempting to access an invalid record.
  # Redirects to a 404 page.
  #
  def render_404
    redirect_to not_found_path
  end
end
