# frozen_string_literal: true

require_relative 'helpers/client'
require_relative 'runners/message'

module Legion
  module Extensions
    module Pushover
      class Client
        include Helpers::Client
        include Runners::Message

        attr_reader :opts

        def initialize(user_key: nil, api_token: nil, **extra)
          @opts = { user: user_key, token: api_token, **extra }.compact
        end

        def find_setting(key, opts = {})
          opts[key.to_sym] || @opts[key.to_sym]
        end
      end
    end
  end
end
