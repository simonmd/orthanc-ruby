module Orthanc
  class Client
    # ------------- Studies -------------
    # GET /studies
    def studies
      objectify(base_uri["studies"].get)
    end

    # GET /studies/{id}
    def study(id)
      objectify(base_uri["studies/#{id}"].get)
    end

    # DELETE /studies/{id}
    def delete_study(id)
      objectify(base_uri["studies/#{id}"].delete)
    end

    # POST /studies/{id}/anonymize
    def anonymize_study(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      objectify(base_uri["studies/#{id}/anonymize"].post(payload))
    end

    # GET /studies/{id}/archive
    def archive_study(id) # Create ZIP
      base_uri["studies/#{id}/archive"].get # CAREFUL! Returns the whole zipfile
    end

    # GET /studies/{id}/instances
    def study_instances(id) # Retrieve all the instances of this patient in a single REST call
      objectify(base_uri["studies/#{id}/instances"].get)
    end

    # GET /studies/{id}/media
    def study_media(id) # Create a ZIP archive for media storage with DICOMDIR
      base_uri["studies/#{id}/media"].get # CAREFUL! Returns the whole zipfile
    end

    # POST /studies/{id}/modify
    def modify_study(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      objectify(base_uri["studies/#{id}/modify"].post(payload))
    end

    # GET /studies/{id}/module
    def study_module(id)
      objectify(base_uri["studies/#{id}/module"].get)
    end

    # GET /studies/{id}/module-patient
    def study_module_patient(id)
      objectify(base_uri["studies/#{id}/module-patient"].get)
    end

    # GET /studies/{id}/patient
    def study_patient(id)
      objectify(base_uri["studies/#{id}/patient"].get)
    end

    # GET /studies/{id}/series
    def study_series(id) # Retrieve all the series of this patient in a single REST call
      objectify(base_uri["studies/#{id}/series"].get)
    end

    # GET /studies/{id}/shared-tags
    def study_shared_tags(id) # "?simplify" argument to simplify output
      objectify(base_uri["studies/#{id}/shared-tags"].get)
    end

    # GET /studies/{id}/statistics
    def study_statistics(id)
      objectify(base_uri["studies/#{id}/statistics"].get)
    end

  end
end