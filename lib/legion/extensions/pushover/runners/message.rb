# frozen_string_literal: true

# require 'pushover'

module Legion
  module Extensions
    module Pushover
      module Runners
        module Message
          include Legion::Extensions::Pushover::Helpers::Client

          def push(message:, title: nil, **)
            result = message(message: message, title: title, **).push
            raise IOError, result.errors unless result.errors.nil?

            {}
          end

          def emergency(message:, title: nil, **)
            result = message(message: message, title: title, priority: 2, **).push
            raise IOError, result.errors unless result.errors.nil?

            {}
          end

          def high(message:, title: nil, **)
            result = message(message: message, title: title, priority: 1, **).push
            raise IOError, result.errors unless result.errors.nil?

            {}
          end

          def normal(message:, title: nil, **)
            result = message(message: message, title: title, **).push
            raise IOError, result.errors unless result.errors.nil?

            {}
          end

          def low(message:, title: nil, **)
            result = message(message: message, title: title, priority: -1, **).push
            raise IOError, result.errors unless result.errors.nil?

            {}
          end

          def lowest(message:, title: nil, **)
            result = message(message: message, title: title, priority: -2, **).push
            raise IOError, result.errors unless result.errors.nil?

            {}
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
