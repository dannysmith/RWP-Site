# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  #TODO Remove before Live:
  before_filter :http_authenticate
  
  def http_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'rwp' && password == 'rwp108'
    end
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  #This variable contains the sites options, as stored in the database.
  $site = Site.first
  
  #Returns the current cart or a new cart, dependant on whether the session contains one or not.
  def find_cart 
    session[:cart] ||= Cart.new 
  end


end
