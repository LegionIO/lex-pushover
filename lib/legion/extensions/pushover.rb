# frozen_string_literal: true

require 'legion/extensions/pushover/version'
require 'legion/extensions/pushover/client'

module Legion
  module Extensions
    module Pushover
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
