module Orthanc
  class Client
    # ------------- Peers -------------
    # GET /peers
    def peers # Get the list of all the registered plugins
      objectify(base_uri["peers"].get)
    end

    # GET /peers/{peer}
    def peer(peer)
      objectify(base_uri["peers/#{peer}"].get)
    end

    # DELETE /peers/{peer}
    def delete_peer(peer)
      objectify(base_uri["peers/#{peer}"].delete)
    end

    # PUT /peers/{peer}
    def modify_peer(peer, payload = {})
      objectify(base_uri["peers/#{peer}"].put(payload))
    end

    # GET /peers/{peer}/store
    def peer_store(peer, payload = {}) # POST body = UUID series, UUID instance, or raw DICOM file
      objectify(base_uri["peers/#{peer}/store"].post(payload))
    end   

  end
end