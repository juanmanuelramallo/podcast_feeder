# frozen_string_literal: true

require 'kiba'
require 'etl/sources/csv'
require 'etl/download_logs'
require 'etl/transforms/filter_analytics'

module ETL
  module Task
    module_function

    def setup(object_key:, bucket_name:)
      filename = "tmp/#{object_key.gsub('/', '-')}".sub('.gz', '')

      Kiba.parse do
        pre_process do
          ::ETL::DownloadLogs.new(object_key: object_key, bucket_name: bucket_name).call
        end

        source ::ETL::Sources::CSV, filename: filename, csv_options: { col_sep: "\t", quote_char: "'" }

        transform ETL::Transforms::FilterAnalytics

        # TODO:
        # transform ExtractValuesTransform
        # transform UserAgenTransform
        # transform GeoIpTransform

        # destination DatabaseDestination

        # post_process do
        #   File.delete(@filename)
        # end
      end
    end
  end
end
