module Orthanc
  class Client
    # ------------- Patients -------------
    # GET /patients
    def patients
      objectify(base_uri["patients"].get)
    end

    # GET /patients/{id}
    def patient(id)
      objectify(base_uri["patients/#{id}"].get)
    end

    # DELETE /patients/{id} 
    def delete_patient(id)
      objectify(base_uri["patients/#{id}"].delete)
    end

    # POST /patients/{id}/anonymize
    def anonymize_patient(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      objectify(base_uri["patients/#{id}/anonymize"].post(payload))
    end

    # GET /patients/{id}/archive
    def archive_patient(id) # Create ZIP
      base_uri["patients/#{id}/archive"].get # CAREFUL! Returns the whole zipfile
    end

    # GET /patients/{id}/instances
    def patient_instances(id) # Retrieve all the instances of this patient in a single REST call
      objectify(base_uri["patients/#{id}/instances"].get)
    end

    # GET /patients/{id}/media
    def patient_media(id) # Create a ZIP archive for media storage with DICOMDIR
      base_uri["patients/#{id}/media"].get # CAREFUL! Returns the whole zipfile
    end

    # POST /patients/{id}/modify
    def modify_patient(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      objectify(base_uri["patients/#{id}/modify"].post(payload))
    end

    # GET /patients/{id}/module
    def patient_module(id)
      objectify(base_uri["patients/#{id}/module"].get)
    end

    # GET /patients/{id}/protected
    def is_patient_protected?(id) # Protection against recycling: "0" means unprotected, "1" protected
      num_to_bool(base_uri["patients/#{id}/protected"].get)
    end

    # PUT /patients/{id}/protected
    def set_patient_protected(id, boolstatus = true) # Protection against recycling: "0" means unprotected, "1" protected
      status = bool_to_num(boolstatus)
      base_uri["patients/#{id}/protected"].put("#{status}")
      return nil # API returns ""
    end

    # GET /patients/{id}/series
    def patient_series(id) # Retrieve all the series of this patient in a single REST call
      objectify(base_uri["patients/#{id}/series"].get)
    end

    # GET /patients/{id}/shared-tags
    def patient_shared_tags(id) # "?simplify" argument to simplify output
      objectify(base_uri["patients/#{id}/shared-tags"].get)
    end

    # GET /patients/{id}/statistics
    def patient_statistics(id)
      objectify(base_uri["patients/#{id}/statistics"].get)
    end

    # GET /patients/{id}/studies
    def patient_studies(id) # Retrieve all the studies of this patient in a single REST call
      objectify(base_uri["patients/#{id}/studies"].get)
    end

  end
end