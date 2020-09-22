# frozen_string_literal: true

module Analytics
  extend ActiveSupport::Concern

  BASE_LOG_LINE = 'podcastfeeder-analytics'

  included do
    after_action :log
  end

  private

  def data
    {
      action_name: action_name,
      controller_name: controller_name,
      format: request.format.to_s,
      ip: request.remote_ip,
      user_agent: request.user_agent
    }.to_json
  end

  def log
    logger.info { "#{BASE_LOG_LINE}=#{data}" }
  end
end
