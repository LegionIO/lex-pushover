require 'pushover'

module Legion::Extensions::Pushover
  module Helpers
    module Client
      def message(**opts)
        client_hash = {}
        %i[message priority device title url url_title sound expire retry callback].each do |thing|
          client_hash[thing] = opts[thing] if opts.key?(thing) && !opts[thing].nil?
        end
        ::Pushover::Message.new(token:     token(opts),
                                user:      user(opts),
                                timestamp: Time.now.getlocal,
                                **client_hash)
      end

      def timestamp(**opts)
        opts[:timstamp] if opts.key? :timestamp
        Time.now.getutc
      end

      def token(**opts)
        find_setting('token', opts)
      end

      def user(**opts)
        find_setting('user', opts)
      end
    end
  end
end
