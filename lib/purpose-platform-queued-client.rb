require 'vertebrae'
require 'purpose-platform-queued-client/client'

module PurposePlatformQueuedClient
  extend Vertebrae::Base

  class << self
    def new(options = {}, &block)
      PurposePlatformQueuedClient::Client.new(options, &block)
    end
  end
end