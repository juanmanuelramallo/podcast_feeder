# frozen_string_literal: true

module Analytics
  extend ActiveSupport::Concern

  included do
    after_action :log
  end

  private

  def data
    {
      path: request.path,
      query_string: request.query_string,
      referrer: request.referrer,
      format: request.format.to_s,
      ip: request.remote_ip,
      user_agent: request.user_agent,
      method: request.method
    }.to_json
  end

  def log
    logger.unknown { "podcastfeeder-analytics=#{data}" }
  end
end
