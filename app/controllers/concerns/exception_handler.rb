# This class raises different custom Exceptions depending of the response of
# the system.
module ExceptionHandler

  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end

  included do

    # Define custom handlers

    rescue_from ActiveRecord::RecordNotFound do |e|
      # This method is implemented in concern/response.rb
      #head :not_found
      render message: 'Record not found', status: 404
    end

  end

end
