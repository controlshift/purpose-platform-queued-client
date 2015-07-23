module PurposePlatformQueuedClient
  class Base < Vertebrae::Model
    def create(params)
      resp = client.post_request(base_path, params)
    end
  end
end