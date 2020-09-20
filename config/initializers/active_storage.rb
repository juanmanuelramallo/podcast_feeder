# frozen_string_literal: true

require_relative '../../app/analyzers/audio_analyzer'

Rails.application.config.active_storage.analyzers.prepend AudioAnalyzer

Rails.configuration.to_prepare do
  ActiveStorage::BaseController.include ::Analytics
end
