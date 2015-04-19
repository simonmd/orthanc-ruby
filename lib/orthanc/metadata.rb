module Orthanc
  class Metadata
    include Response
    attr_accessor :base_uri

    def initialize(resource, id = nil)
      self.base_uri = resource["/metadata/#{id}"]
    end

    # GET /{resourceType}/{id}/metadata/{name}
    def fetch # Fetch API response
      handle_response(base_uri.get)
    end

    # DELETE /{resourceType}/{id}/metadata/{name}
    def delete
      handle_response(base_uri.delete)
    end

    # PUT /{resourceType}/{id}/metadata/{name}
    def modify(payload = {})
      handle_response(base_uri.put(payload))
    end

  end
end
