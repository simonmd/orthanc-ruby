module Orthanc
  class Client
    # ------------- Patients -------------
    # GET /patients
    def all_patients
      handle_response(base_uri["patients"].get)
    end

    # GET /patients/{id}
    def patient(id)
      handle_response(base_uri["patients/#{id}"].get)
    end

    # DELETE /patients/{id}
    def delete_patient(id)
      handle_response(base_uri["patients/#{id}"].delete)
    end

    # POST /patients/{id}/anonymize
    def anonymize_patient(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      handle_response(base_uri["patients/#{id}/anonymize"].post(payload.to_s))
    end

    # GET /patients/{id}/archive
    def archive_patient(id) # Create ZIP
      base_uri["patients/#{id}/archive"].get # CAREFUL! Returns the whole zipfile
    end

    # GET /patients/{id}/instances
    def patient_instances(id) # Retrieve all the instances of this patient in a single REST call
      handle_response(base_uri["patients/#{id}/instances"].get)
    end

    # GET /patients/{id}/media
    def patient_media(id) # Create a ZIP archive for media storage with DICOMDIR
      base_uri["patients/#{id}/media"].get # CAREFUL! Returns the whole zipfile
    end

    # POST /patients/{id}/modify
    def modify_patient(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      handle_response(base_uri["patients/#{id}/modify"].post(payload.to_s))
    end

    # GET /patients/{id}/module
    def patient_module(id)
      handle_response(base_uri["patients/#{id}/module"].get)
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
      handle_response(base_uri["patients/#{id}/series"].get)
    end

    # GET /patients/{id}/shared-tags
    def patient_shared_tags(id) # "?simplify" argument to simplify output
      handle_response(base_uri["patients/#{id}/shared-tags"].get)
    end

    # GET /patients/{id}/statistics
    def patient_statistics(id)
      handle_response(base_uri["patients/#{id}/statistics"].get)
    end

    # GET /patients/{id}/studies
    def patient_studies(id) # Retrieve all the studies of this patient in a single REST call
      handle_response(base_uri["patients/#{id}/studies"].get)
    end

    # TODO: Polymorphic resourceType resources. Repetitive. must refactor

    # GET /{resourceType}/{id}/attachments
    def patient_attachments(id)
      handle_response(base_uri["patients/#{id}/attachments"].get)
    end

    # DELETE /{resourceType}/{id}/attachments/{name}
    def delete_patient_attachment(id, name)
      handle_response(base_uri["patients/#{id}/attachments/#{name}"].delete)
    end

    # PUT /{resourceType}/{id}/attachments/{name}
    def patient_attachment(id, name, payload = {})
      handle_response(base_uri["patients/#{id}/attachments/#{name}"].put(payload))
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-data
    def patient_attachment_compressed_data(id, name)
      handle_response(base_uri["patients/#{id}/attachments/#{name}/compressed-data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-md5
    def patient_attachment_compressed_md5(id, name)
      handle_response(base_uri["patients/#{id}/attachments/#{name}/compressed-md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-size
    def patient_attachment_compressed_size(id, name)
      handle_response(base_uri["patients/#{id}/attachments/#{name}/compressed-size"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/data
    def patient_attachment_data(id, name)
      handle_response(base_uri["patients/#{id}/attachments/#{name}/data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/md5
    def patient_attachment_md5(id, name)
      handle_response(base_uri["patients/#{id}/attachments/#{name}/md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/size
    def patient_attachment_size(id, name)
      handle_response(base_uri["patients/#{id}/attachments/#{name}/size"].get)
    end

    # POST /{resourceType}/{id}/attachments/{name}/verify-md5
    def patient_attachment_verify_md5(id, name)
      handle_response(base_uri["patients/#{id}/attachments/#{name}/verify-md5"].get)
    end

    # GET /{resourceType}/{id}/metadata
    def patient_all_metadata(id)
      handle_response(base_uri["patients/#{id}/metadata"].get)
    end

    # GET /{resourceType}/{id}/metadata/{name}
    def patient_metadata(id, name)
      handle_response(base_uri["patients/#{id}/metadata/#{name}"].get)
    end

    # DELETE /{resourceType}/{id}/metadata/{name}
    def patient_delete_metadata(id, name)
      handle_response(base_uri["patients/#{id}/metadata/#{name}"].delete)
    end

    # PUT /{resourceType}/{id}/metadata/{name}
    def patient_update_metadata(id, name, payload = {})
      handle_response(base_uri["patients/#{id}/metadata/#{name}"].put(payload))
    end

  end
end
