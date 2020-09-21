# frozen_string_literal: true

class LogWebhooksController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def create
    return head(:bad_request) unless valid_token?

    # JSON.parse(request.body.read)
    # TODO: enqueue ETL job

    head(:no_content)
  end

  private

  def valid_token?
    request.headers['Authorization'] == "Bearer #{ENV.fetch('LOG_WEBHOOK_TOKEN')}"
  end
end
