module Orthanc
  class Modality
    include Response
    attr_accessor :base_uri

    def initialize(id = nil)
      client = Client.new
      self.base_uri = client.base_uri["/modalities/#{id}"]
    end

    # GET /modalities, # GET /modalities/{id}
    def fetch
      handle_response(base_uri.get)
    end

    # DELETE /modalities/{id}
    def delete
      handle_response(base_uri.delete)
    end

    # PUT /modalities/{dicom}
    def modify(payload = {})
      handle_response(base_uri["modalities/#{dicom}"].put(payload))
    end

    # POST /modalities/{dicom}/echo
    def echo(payload = {}) # C-Echo SCU
      handle_response(base_uri["echo"].post(payload))
    end

    # POST /modalities/{dicom}/find
    def find(payload = {})
      handle_response(base_uri["find"].post(payload))
    end

    # POST /modalities/{dicom}/find-patient
    def find_patient(payload = {})
      handle_response(base_uri["find-patient"].post(payload))
    end

    # POST /modalities/{dicom}/find-series
    def find_series(payload = {})
      handle_response(base_uri["find-series"].post(payload))
    end

    # POST /modalities/{dicom}/find-study
    def find_study(payload = {})
      handle_response(base_uri["find-study"].post(payload))
    end

    # POST /modalities/{dicom}/store
    def store(payload = {}) # POST body = UUID series, UUID instance, or raw DICOM file
      handle_response(base_uri["store"].post(payload))
    end

  end
end
