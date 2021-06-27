class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prepend filter, it has to run before `authenticate_user!`.
  protect_from_forgery with: :exception, prepend: true

end
