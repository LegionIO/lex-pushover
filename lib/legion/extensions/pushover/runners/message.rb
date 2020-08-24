# require 'pushover'

module Legion::Extensions::Pushover
  module Runners
    module Message
      include Legion::Extensions::Pushover::Helpers::Client

      def push(message:, title: nil, **opts)
        result = message(message: message, title: title, **opts).push
        raise IOError, result.errors unless result.errors.nil?

        {}
      end

      def emergency(message:, title: nil, **opts)
        result = message(message: message, title: title, priority: 2, **opts).push
        raise IOError, result.errors unless result.errors.nil?

        {}
      end

      def high(message:, title: nil, **opts)
        result = message(message: message, title: title, priority: 1, **opts).push
        raise IOError, result.errors unless result.errors.nil?

        {}
      end

      def normal(message:, title: nil, **opts)
        result = message(message: message, title: title, **opts).push
        raise IOError, result.errors unless result.errors.nil?

        {}
      end

      def low(message:, title: nil, **opts)
        result = message(message: message, title: title, priority: -1, **opts).push
        raise IOError, result.errors unless result.errors.nil?

        {}
      end

      def lowest(message:, title: nil, **opts)
        result = message(message: message, title: title, priority: -2, **opts).push
        raise IOError, result.errors unless result.errors.nil?

        {}
      end

      include Legion::Extensions::Helpers::Lex
    end
  end
end
