# frozen_string_literal: true

module LogMatcher
  LOG_PATH = "log/test#{ENV['TEST_ENV_NUMBER']}.log"

  class LogMatcher
    attr_reader :expected_logs, :initial_log_file_position

    def initialize(expected_logs, initial_log_file_position = 0)
      @expected_logs = expected_logs
      @initial_log_file_position = initial_log_file_position
    end

    def matches?(subject)
      move_file_position(subject)
      subject.call if subject.is_a?(Proc)

      return logs.match?(expected_logs) if expected_logs.is_a?(Regexp)

      call_expected_logs
      logs.include?(expected_logs)
    end

    def failure_message
      "Expected subject to have logged `#{expected_logs}' in:\n\t#{logs}"
    end

    def failure_message_when_negated
      "Expected subject not to have logged `#{expected_logs}' in:\n\t#{logs}"
    end

    def supports_block_expectations?
      true
    end

    private

    def call_expected_logs
      @expected_logs = expected_logs.call if expected_logs.is_a?(Proc)
    end

    def log_file
      @log_file ||= File.new(Rails.root.join(LOG_PATH))
    end

    def logs
      @logs ||= log_file.read
    end

    def move_file_position(subject)
      case subject
      when Proc
        log_file.seek(0, IO::SEEK_END)
      when Capybara::Session
        log_file.seek(initial_log_file_position)
      end
    end
  end

  def log(expected_logs)
    LogMatcher.new(expected_logs, @log_file_position)
  end

  def set_log_file_position
    @log_file_position = File.new(Rails.root.join(LOG_PATH)).sysseek(0, IO::SEEK_END)
  end

  RSpec.configure do |config|
    config.before(:each, type: :feature) do
      set_log_file_position
    end

    config.include ::LogMatcher
  end
end
