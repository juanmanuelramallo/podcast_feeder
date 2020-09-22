# frozen_string_literal: true

module ETL
  module Transforms
    class FilterAnalytics
      def process(row)
        row.last.include?(Analytics::BASE_LOG_LINE) ? row : nil
      end
    end
  end
end
