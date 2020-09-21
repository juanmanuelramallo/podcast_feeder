# frozen_string_literal: true

module ETL
  module Task
    module_function

    def setup(object_key:, bucket_name:)
      Kiba.parse do
        pre_process do
          @filename = DownloadLogs.new(object_key: object_key, bucket_name: bucket_name).call
        end

        source TSVSource

        transform ExtractValuesTransform
        transform UserAgenTransform
        transform GeoIpTransform

        destination DatabaseDestination

        post_process do
          File.delete(@filename)
        end
      end
    end
  end
end
