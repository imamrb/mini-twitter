class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception, prepend: true
  before_action :require_login
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  private

  def handle_record_not_found
    flash[:alert] = 'The requested resource couldn\'t be found! Please try again.'
    redirect_to root_path
  end
end
