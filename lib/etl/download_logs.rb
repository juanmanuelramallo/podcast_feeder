# frozen_string_literal: true

require 'aws-sdk-s3'

module ETL
  class DownloadLogs
    attr_reader :object_key, :bucket_name

    def initialize(object_key:, bucket_name:)
      @object_key = object_key
      @bucket_name = bucket_name
    end

    def call
      response = client.get_object(bucket: bucket_name, key: object_key)

      File.open(filename, 'w+') do |f|
        f.puts response.body.read
      end

      filename
    end

    private

    def client
      @_client ||= ::Aws::S3::Client.new
    end

    def filename
      @_filename ||= "tmp/#{object_key.gsub('/', '-')}"
    end
  end
end
