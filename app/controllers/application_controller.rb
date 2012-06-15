require 'fresk_responder'

class ApplicationController < ActionController::Base
  self.responder = FreskResponder
  respond_to :html

  protect_from_forgery
end
