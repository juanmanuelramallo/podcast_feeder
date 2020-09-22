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
      object = resource.bucket(bucket_name).object(object_key)
      object.get(response_target: filename)
      `gzip -d #{filename}` if Dir[filename].empty?

      filename
    end

    private

    def resource
      @_resource ||= ::Aws::S3::Resource.new
    end

    def filename
      @_filename ||= "tmp/#{object_key.gsub('/', '-')}"
    end
  end
end
