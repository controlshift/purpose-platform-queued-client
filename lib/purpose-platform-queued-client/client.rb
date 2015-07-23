module PurposePlatformQueuedClient
  class Client < Vertebrae::API
    def action
      @action ||= PurposePlatformQueuedClient::Action.new(client: self)
    end

    def unsubscribe
      @unsubscribe ||= PurposePlatformQueuedClient::Unsubscribe.new(client: self)
    end 

    private 

    def default_options
      {
        ssl: { verify: false },
        user_agent: 'PurposePlatformQueuedClient',
        prefix: '',
        content_type: 'application/x-www-form-urlencoded'
      }
    end

    def request(method, path, params, options) # :nodoc:
      if !::Vertebrae::Request::METHODS.include?(method)
        raise ArgumentError, "unknown http method: #{method}"
      end

      path =  connection.configuration.prefix + '/' + path

      ::Vertebrae::Base.logger.debug "EXECUTED: #{method} - #{path} with #{params} and #{options}"

      connection.connection.send(method) do |request|

        case method.to_sym
          when *(::Vertebrae::Request::METHODS - ::Vertebrae::Request::METHODS_WITH_BODIES)
            request.url(path, params)
          when *::Vertebrae::Request::METHODS_WITH_BODIES
            request.path = path
            request.body = params unless params.empty?
        end
      end
    end


    def extract_data_from_params(params) # :nodoc:
      if params.has_key?('data') && params['data'].present?
        return params['data']
      else
        return params
      end
    end

    def setup
      connection.stack do |builder|
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded

        builder.use Faraday::Response::Logger if ENV['DEBUG']

        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson

        builder.adapter connection.configuration.adapter
      end
    end
  end
end

 