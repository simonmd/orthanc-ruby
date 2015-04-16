module Orthanc
  class Client
    # ------------- Tools -------------

    # POST /tools/create-dicom
    def tools_create_dicom(payload = {}) # Create and store a new DICOM instance (experimental)
      objectify(base_uri["tools/create-dicom"].post(payload))
    end

    # GET /tools/dicom-conformance
    def tools_dicom_conformance # DICOM conformance statement of this version of Orthanc
      base_uri["tools/dicom-conformance"].get
    end

    # POST /tools/execute-script
    def tools_execute_script(payload = {}) # Execute the Lua script in the POST body (experimental)
      objectify(base_uri["tools/execute-script"].post(payload))
    end

    # GET /tools/generate-uid
    def tools_generate_uid(level) # "level" argument among "patient", "study", "series" and "instance"
      objectify(base_uri["tools/generate-uid"].get({params: {level: level}}))
    end

    # POST /tools/lookup
    def tools_lookup(payload = {}) # Map DICOM UIDs to Orthanc identifiers
      objectify(base_uri["tools/lookup"].post(payload))
    end

    # GET /tools/now
    def tools_now # Returns the current datetime in the ISO 8601 format
      base_uri["tools/now"].get
    end

    # POST /tools/reset
    def tools_reset(payload = {}) # Hot restart of Orthanc, the configuration file will be read again
      objectify(base_uri["tools/reset"].post(payload))
    end

  end
end