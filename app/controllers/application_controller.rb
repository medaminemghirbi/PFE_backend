class ApplicationController < ActionController::API
  include CurrentUserConcern
  
  skip_before_action :verify_authenticity_token, raise: false
  
end
