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
      objectify(base_uri["system"].get)
    end

    def statistics
      objectify(base_uri["statistics"].get)
    end

    def changes(params = {}) # "last", "limit" and "since" arguments
      objectify(base_uri["changes"].get({params: params}))
    end

    def delete_changes(params = {}) # "last", "limit" and "since" arguments
      objectify(base_uri["changes"].delete({params: params}))
    end

    def exports(params = {}) # "last", "limit" and "since" arguments
      objectify(base_uri["exports"].get({params: params}))
    end

    def delete_exports(params = {}) # "last", "limit" and "since" arguments
      objectify(base_uri["exports"].delete({params: params}))
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

    def lowkey(h)
      Hash[h.map{|k,v| v.class == Array ? [k,v.map{|r| f r}.to_a] : [k.downcase,v]}]
    end

    def objectify(response)
      if JSON.parse(response).class == Array
        return JSON.parse(response)
      else
        return RecursiveOpenStruct.new(JSON.parse(response).to_snake_keys, recurse_over_arrays: true )
      end
    end

  end
end