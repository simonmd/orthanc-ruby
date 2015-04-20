module Orthanc
  class Modality
    include Response
    attr_accessor :base_uri

    def initialize(id = nil)
      client = Client.new
      self.base_uri = client.base_uri["/modalities/#{id}"]
    end

    # GET /modalities, # GET /modalities/{id}
    def fetch # Fetch API response
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
    def echo(payload = {}) # C-Echo SCU. Return true if successful
      base_uri["echo"].post(payload){|response, request, result, &block|
        if response.code == 200
          return true
        else
          return false
        end
      }
    end

    # POST /modalities/{dicom}/find
    def find(payload = {}) # C-Echo SCU. Return true if successful
      rsp = base_uri["find"].post(payload){|response, request, result, &block|
        if response.code == 200
          return rsp
        else
          return false
        end
      }
    end

    # POST /modalities/{dicom}/find-patient
    def find_patient(payload = {}) # eg. '{"PatientName":"JOD*","PatientSex":"M"}'
      rsp = base_uri["find-patient"].post(payload){|response, request, result, &block|
        if response.code == 200
          return rsp
        else
          return false
        end
      }
    end

    # POST /modalities/{dicom}/find-series
    def find_series(payload = {}) # eg. '{"PatientID":"0555643F"}'
      rsp = base_uri["find-series"].post(payload){|response, request, result, &block|
        if response.code == 200
          return rsp
        else
          return false
        end
      }
    end

    # POST /modalities/{dicom}/find-study
    def find_study(payload = {}) # eg. '{"PatientID":"0555643F","StudyInstanceUID":"1.2.840.113704.1.111.2768.1239195678.57"}'
      rsp = base_uri["find-study"].post(payload){|response, request, result, &block|
        if response.code == 200
          return rsp
        else
          return false
        end
      }
    end

    # POST /modalities/{dicom}/store
    def store(payload = {}) # POST body = UUID series, UUID instance, or raw DICOM file
      base_uri["store"].post(payload){|response, request, result, &block|
        if response.code == 200
          return true
        else
          return false
        end
      }
    end

  end
end
