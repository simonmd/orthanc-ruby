module Orthanc
  class Client
    # ------------- Series -------------
    # GET /series
    def series
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

  end
end