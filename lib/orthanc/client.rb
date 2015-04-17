require 'orthanc/tools'
require 'orthanc/plugins'
require 'orthanc/modalities'
require 'orthanc/peers'
require 'orthanc/patients'
require 'orthanc/studies'
require 'orthanc/series'
require 'orthanc/instances'

module Orthanc
  class Client

    attr_accessor :base_uri

    def initialize(host,port = 8042)
      self.base_uri = RestClient::Resource.new("http://#{host}:#{port}")
    end

    # ------------- General -------------
    def system
      handle_response(base_uri["system"].get)
    end

    def statistics
      handle_response(base_uri["statistics"].get)
    end

    def changes(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["changes"].get({params: params}))
    end

    def delete_changes(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["changes"].delete({params: params}))
    end

    def exports(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["exports"].get({params: params}))
    end

    def delete_exports(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["exports"].delete({params: params}))
    end


    private

    def bool_to_num(bool)
      return 0 if bool == false
      return 1 if bool == true
    end

    def num_to_bool(num)
      return false if num == "0"
      return true if num == "1"
    end

    def handle_response(response)
      begin
        # Try to parse response
        parsed_response = JSON.parse(response)

        if parsed_response.class == Array
          return parsed_response
        elsif parsed_response.class == Hash
          return RecursiveOpenStruct.new(parsed_response.to_snake_keys, recurse_over_arrays: true )
        else
          return response
        end
      rescue JSON::ParserError => e # If JSON parse fails, return original response
        return response
      end
    end

  end
end
