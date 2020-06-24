# frozen_string_literal: true

require_relative '../../app/analyzers/audio_analyzer'

Rails.application.config.active_storage.analyzers.prepend AudioAnalyzer
