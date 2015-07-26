require 'vertebrae'
require 'purpose-platform-queued-client/client'
require 'purpose-platform-queued-client/base'
require 'purpose-platform-queued-client/action'
require 'purpose-platform-queued-client/unsubscribe'


module PurposePlatformQueuedClient
  extend Vertebrae::Base

  class << self
    def new(options = {}, &block)
      PurposePlatformQueuedClient::Client.new(options, &block)
    end
  end
end