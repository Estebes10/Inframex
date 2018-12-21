class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  include ExceptionHandler

  # Confirms a logged-in user.
  def validate_user
    unless logged_in?
      store_location
      redirect_to login_url
    end
  end
end
