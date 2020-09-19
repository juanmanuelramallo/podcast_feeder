# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Analytics

  before_action :authenticate

  private

  def authenticate
    return unless request.format != Mime[:rss]

    http_basic_authenticate_or_request_with(
      name: ENV.fetch('HTTP_BASIC_AUTH_NAME'),
      password: ENV.fetch('HTTP_BASIC_AUTH_PASSWORD')
    )
  end
end
