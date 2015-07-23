require 'vertebrae'
require 'purpose-platform-queued-client/client'
require 'purpose-platform-queued-client/base'
require 'purpose-platform-queued-client/action'

module PurposePlatformQueuedClient
  extend Vertebrae::Base

  class << self
    def new(options = {}, &block)
      options = options.merge(prefix: '')
      PurposePlatformQueuedClient::Client.new(options, &block)
    end
  end
end