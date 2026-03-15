# frozen_string_literal: true

require 'spec_helper'
require 'pushover'

module Legion
  module Extensions
    module Helpers
      module Lex; end
    end
  end
end

require 'legion/extensions/pushover/client'

RSpec.describe Legion::Extensions::Pushover::Client do
  describe '#initialize' do
    it 'stores user_key as :user in opts' do
      expect(described_class.new(user_key: 'ukey123').opts).to include(user: 'ukey123')
    end

    it 'stores api_token as :token in opts' do
      expect(described_class.new(api_token: 'tok456').opts).to include(token: 'tok456')
    end

    it 'stores both user_key and api_token' do
      expect(described_class.new(user_key: 'u', api_token: 't').opts).to include(user: 'u', token: 't')
    end

    it 'compacts nil values from opts' do
      expect(described_class.new(user_key: nil, api_token: 'tok').opts).not_to have_key(:user)
    end

    it 'stores extra keyword arguments in opts' do
      expect(described_class.new(user_key: 'u', api_token: 't', device: 'iphone').opts).to include(device: 'iphone')
    end
  end

  describe '#find_setting' do
    subject(:client) { described_class.new(user_key: 'ukey', api_token: 'tok') }

    it 'returns value from @opts when key found' do
      expect(client.find_setting('token')).to eq('tok')
    end

    it 'returns value from opts hash argument when provided' do
      expect(client.find_setting('token', { token: 'override' })).to eq('override')
    end

    it 'falls back to @opts when opts hash does not contain key' do
      expect(client.find_setting('user', {})).to eq('ukey')
    end
  end

  describe 'runner methods' do
    subject(:client) { described_class.new(user_key: 'ukey', api_token: 'tok') }

    it { is_expected.to respond_to(:push) }
    it { is_expected.to respond_to(:emergency) }
    it { is_expected.to respond_to(:high) }
    it { is_expected.to respond_to(:normal) }
    it { is_expected.to respond_to(:low) }
    it { is_expected.to respond_to(:lowest) }
  end
end
