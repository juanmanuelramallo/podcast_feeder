# frozen_string_literal: true

require 'etl/task'

class ETLJob < ApplicationJob
  queue_as :default

  def perform(bucket_name:, object_key:)
    etl_job = ::ETL::Task.setup(bucket_name: bucket_name, object_key: object_key)
    Kiba.run(etl_job)
  end
end
