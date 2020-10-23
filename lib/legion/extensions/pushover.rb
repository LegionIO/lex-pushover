require 'legion/extensions/pushover/version'

module Legion
  module Extensions
    module Pushover
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
