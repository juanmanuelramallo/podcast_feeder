# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log webhook' do
  before do
    stub_const 'ENV', ENV.to_h.merge('LOG_WEBHOOK_TOKEN' => 'test-token')
  end

  describe 'POST /log_webhook' do
    it 'returns bad request' do
      post log_webhook_path, headers: { 'Authorization' => 'Bearer wrong-token' }

      expect(response.code).to eq '400'
    end

    it 'returns no content' do
      post log_webhook_path, headers: { 'Authorization' => 'Bearer test-token' }

      expect(response.code).to eq '204'
    end
  end
end
