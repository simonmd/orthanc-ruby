module Orthanc
  class Client
    # ------------- Modalities -------------
    # GET /modalities
    def modalities
      handle_response(base_uri["modalities"].get)
    end

    # GET /modalities/{dicom}
    def modality(dicom)
      handle_response(base_uri["modalities/#{dicom}"].get)
    end

    # DELETE /modalities/{dicom}
    def delete_modality(dicom)
      handle_response(base_uri["modalities/#{dicom}"].delete)
    end

    # PUT /modalities/{dicom}
    def modify_modality(dicom, payload = {})
      handle_response(base_uri["modalities/#{dicom}"].put(payload))
    end

    # POST /modalities/{dicom}/echo
    def modality_echo(dicom, payload = {}) # C-Echo SCU
      handle_response(base_uri["modalities/#{dicom}/echo"].post(payload))
    end

    # POST /modalities/{dicom}/find
    def modality_find(dicom, payload = {})
      handle_response(base_uri["modalities/#{dicom}/find"].post(payload))
    end

    # POST /modalities/{dicom}/find-patient
    def modality_find_patient(dicom, payload = {})
      handle_response(base_uri["modalities/#{dicom}/find-patient"].post(payload))
    end

    # POST /modalities/{dicom}/find-series
    def modality_find_series(dicom, payload = {})
      handle_response(base_uri["modalities/#{dicom}/find-series"].post(payload))
    end

    # POST /modalities/{dicom}/find-study
    def modality_find_study(dicom, payload = {})
      handle_response(base_uri["modalities/#{dicom}/find-study"].post(payload))
    end

    # POST /modalities/{dicom}/store
    def modality_store(dicom, payload = {}) # POST body = UUID series, UUID instance, or raw DICOM file
      handle_response(base_uri["modalities/#{dicom}/store"].post(payload))
    end

  end
end
