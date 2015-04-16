module Orthanc
  class Client
    # ------------- Series -------------
    # GET /series
    def all_series # Darn DICOM, why did you have to call them something that's spelled the same singular and plural?
      objectify(base_uri["series"].get)
    end

    # GET /series/{id}
    def series(id)
      objectify(base_uri["series/#{id}"].get)
    end

    # DELETE /series/{id}
    def delete_series(id)
      objectify(base_uri["series/#{id}"].delete)
    end

    # POST /series/{id}/anonymize
    def anonymize_series(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      objectify(base_uri["series/#{id}/anonymize"].post(payload))
    end

    # GET /series/{id}/archive
    def archive_series(id) # Create ZIP
      base_uri["series/#{id}/archive"].get # CAREFUL! Returns the whole zipfile
    end

    # GET /series/{id}/instances
    def series_instances(id) # Retrieve all the instances of this patient in a single REST call
      objectify(base_uri["series/#{id}/instances"].get)
    end

    # GET /series/{id}/media
    def series_media(id) # Create a ZIP archive for media storage with DICOMDIR
      base_uri["series/#{id}/media"].get # CAREFUL! Returns the whole zipfile
    end

    # POST /series/{id}/modify
    def modify_series(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      objectify(base_uri["series/#{id}/modify"].post(payload))
    end

    # GET /series/{id}/module
    def series_module(id)
      objectify(base_uri["series/#{id}/module"].get)
    end

    # GET /series/{id}/patient
    def series_patient(id)
      objectify(base_uri["series/#{id}/patient"].get)
    end

    # GET /series/{id}/shared-tags
    def series_shared_tags(id) # "?simplify" argument to simplify output
      objectify(base_uri["series/#{id}/shared-tags"].get)
    end

    # GET /series/{id}/statistics
    def series_statistics(id)
      objectify(base_uri["series/#{id}/statistics"].get)
    end

    # GET /series/{id}/study
    def series_study(id)
      objectify(base_uri["series/#{id}/study"].get)
    end

    # TODO: Polymorphic resourceType resources. Repetitive. must refactor

    # GET /{resourceType}/{id}/attachments
    def series_attachments(id)
      objectify(base_uri["series/#{id}/attachments"].get)
    end

    # DELETE /{resourceType}/{id}/attachments/{name}
    def delete_series_attachment(id, name)
      objectify(base_uri["series/#{id}/attachments/#{name}"].delete)
    end

    # PUT /{resourceType}/{id}/attachments/{name}
    def series_attachment(id, name, payload = {})
      objectify(base_uri["series/#{id}/attachments/#{name}"].put(payload))
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-data
    def series_attachment_compressed_data(id, name)
      objectify(base_uri["series/#{id}/attachments/#{name}/compressed-data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-md5
    def series_attachment_compressed_md5(id, name)
      objectify(base_uri["series/#{id}/attachments/#{name}/compressed-md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-size
    def series_attachment_compressed_size(id, name)
      objectify(base_uri["series/#{id}/attachments/#{name}/compressed-size"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/data
    def series_attachment_data(id, name)
      objectify(base_uri["series/#{id}/attachments/#{name}/data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/md5
    def series_attachment_md5(id, name)
      objectify(base_uri["series/#{id}/attachments/#{name}/md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/size
    def series_attachment_size(id, name)
      objectify(base_uri["series/#{id}/attachments/#{name}/size"].get)
    end

    # POST /{resourceType}/{id}/attachments/{name}/verify-md5
    def series_attachment_verify_md5(id, name)
      objectify(base_uri["series/#{id}/attachments/#{name}/verify-md5"].get)
    end

    # GET /{resourceType}/{id}/metadata
    def series_all_metadata(id)
      objectify(base_uri["series/#{id}/metadata"].get)
    end

    # GET /{resourceType}/{id}/metadata/{name}
    def series_metadata(id, name)
      objectify(base_uri["series/#{id}/metadata/#{name}"].get)
    end

    # DELETE /{resourceType}/{id}/metadata/{name}
    def series_delete_metadata(id, name)
      objectify(base_uri["series/#{id}/metadata/#{name}"].delete)
    end

    # GET /{resourceType}/{id}/metadata/{name}
    def series_update_metadata(id, name, payload = {})
      objectify(base_uri["series/#{id}/metadata/#{name}"].put(payload))
    end
    
  end
end