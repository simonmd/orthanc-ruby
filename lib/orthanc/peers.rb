module Orthanc
  class Peer
    include Response
    attr_accessor :base_uri

    def initialize(id = nil)
      client = Client.new
      self.base_uri = client.base_uri["/peers/#{id}"]
    end

    # GET /peers, # GET /peers/{id}
    def fetch
      handle_response(base_uri.get)
    end

    # DELETE /peers/{id}
    def delete
      handle_response(base_uri.delete)
    end

    # PUT /peers/{peer}
    def modify(payload = {})
      handle_response(base_uri.put(payload))
    end

    # GET /peers/{peer}/store
    def store(payload = {}) # POST body = UUID series, UUID instance, or raw DICOM file
      handle_response(base_uri["store"].post(payload))
    end

  end
end
