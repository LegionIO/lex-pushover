# require 'pushover'

module Legion::Extensions::Pushover
  module Runners
    module Message
      include Legion::Extensions::Helpers::Lex
      def self.push(token: nil, user: nil, message: nil, **_opts)
        require 'pushover'
        token = 'apei7jpKBwobv3uGbWvhNzeq6hJLL2' if token.nil?
        user_key = 'udcvYneugDDNoRnXUHF7QokFDfweiP'
        message = ::Pushover::Message.new(token: token, user: user_key, message: message).push
        log.warn message
        {}
      rescue FrozenError
        {}
      end
    end
  end
end
