module Orthanc
  class Client
    # ------------- Studies -------------
    # GET /studies
    def all_studies
      handle_response(base_uri["studies"].get)
    end

    # GET /studies/{id}
    def study(id)
      handle_response(base_uri["studies/#{id}"].get)
    end

    # DELETE /studies/{id}
    def delete_study(id)
      handle_response(base_uri["studies/#{id}"].delete)
    end

    # POST /studies/{id}/anonymize
    def anonymize_study(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      handle_response(base_uri["studies/#{id}/anonymize"].post(payload.to_s))
    end

    # GET /studies/{id}/archive
    def archive_study(id) # Create ZIP
      base_uri["studies/#{id}/archive"].get # CAREFUL! Returns the whole zipfile
    end

    # GET /studies/{id}/instances
    def study_instances(id) # Retrieve all the instances of this patient in a single REST call
      handle_response(base_uri["studies/#{id}/instances"].get)
    end

    # GET /studies/{id}/media
    def study_media(id) # Create a ZIP archive for media storage with DICOMDIR
      base_uri["studies/#{id}/media"].get # CAREFUL! Returns the whole zipfile
    end

    # POST /studies/{id}/modify
    def modify_study(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      handle_response(base_uri["studies/#{id}/modify"].post(payload.to_s))
    end

    # GET /studies/{id}/module
    def study_module(id)
      handle_response(base_uri["studies/#{id}/module"].get)
    end

    # GET /studies/{id}/module-patient
    def study_module_patient(id)
      handle_response(base_uri["studies/#{id}/module-patient"].get)
    end

    # GET /studies/{id}/patient
    def study_patient(id)
      handle_response(base_uri["studies/#{id}/patient"].get)
    end

    # GET /studies/{id}/series
    def study_series(id) # Retrieve all the series of this patient in a single REST call
      handle_response(base_uri["studies/#{id}/series"].get)
    end

    # GET /studies/{id}/shared-tags
    def study_shared_tags(id) # "?simplify" argument to simplify output
      handle_response(base_uri["studies/#{id}/shared-tags"].get)
    end

    # GET /studies/{id}/statistics
    def study_statistics(id)
      handle_response(base_uri["studies/#{id}/statistics"].get)
    end

    # TODO: Polymorphic resourceType resources. Repetitive. must refactor

    # GET /{resourceType}/{id}/attachments
    def study_attachments(id)
      handle_response(base_uri["studies/#{id}/attachments"].get)
    end

    # DELETE /{resourceType}/{id}/attachments/{name}
    def delete_study_attachment(id, name)
      handle_response(base_uri["studies/#{id}/attachments/#{name}"].delete)
    end

    # PUT /{resourceType}/{id}/attachments/{name}
    def study_attachment(id, name, payload = {})
      handle_response(base_uri["studies/#{id}/attachments/#{name}"].put(payload))
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-data
    def study_attachment_compressed_data(id, name)
      handle_response(base_uri["studies/#{id}/attachments/#{name}/compressed-data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-md5
    def study_attachment_compressed_md5(id, name)
      handle_response(base_uri["studies/#{id}/attachments/#{name}/compressed-md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-size
    def study_attachment_compressed_size(id, name)
      handle_response(base_uri["studies/#{id}/attachments/#{name}/compressed-size"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/data
    def study_attachment_data(id, name)
      handle_response(base_uri["studies/#{id}/attachments/#{name}/data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/md5
    def study_attachment_md5(id, name)
      handle_response(base_uri["studies/#{id}/attachments/#{name}/md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/size
    def study_attachment_size(id, name)
      handle_response(base_uri["studies/#{id}/attachments/#{name}/size"].get)
    end

    # POST /{resourceType}/{id}/attachments/{name}/verify-md5
    def study_attachment_verify_md5(id, name)
      handle_response(base_uri["studies/#{id}/attachments/#{name}/verify-md5"].get)
    end

    # GET /{resourceType}/{id}/metadata
    def study_all_metadata(id)
      handle_response(base_uri["studies/#{id}/metadata"].get)
    end

    # GET /{resourceType}/{id}/metadata/{name}
    def study_metadata(id, name)
      handle_response(base_uri["studies/#{id}/metadata/#{name}"].get)
    end

    # DELETE /{resourceType}/{id}/metadata/{name}
    def study_delete_metadata(id, name)
      handle_response(base_uri["studies/#{id}/metadata/#{name}"].delete)
    end

    # PUT /{resourceType}/{id}/metadata/{name}
    def study_update_metadata(id, name, payload = {})
      handle_response(base_uri["studies/#{id}/metadata/#{name}"].put(payload))
    end

  end
end
