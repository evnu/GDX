class ApplicationController < ActionController::Base
  protect_from_forgery

  filter_parameter_logging :password, :password_confirmation
end
