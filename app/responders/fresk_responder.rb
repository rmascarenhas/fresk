class FreskResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder
  # include Responders::CollectionResponder
end
