module PurposePlatformQueuedClient
  class Client < Vertebrae::API
    def action
      @action ||= PurposePlatformQueuedClient::Action.new(client: self)
    end

    def unsubscribe
      @unsubscribe ||= PurposePlatformQueuedClient::Unsubscribe.new(client: self)
    end 
  end
end

 