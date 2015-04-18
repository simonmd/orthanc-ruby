module Orthanc
  class Tool
    include Response
    attr_accessor :base_uri

    def initialize(id = nil)
      client = Client.new
      self.base_uri = client.base_uri["tools"]
    end

    # POST /tools/create-dicom
    def create_dicom(payload = {}) # Create and store a new DICOM instance (experimental)
      handle_response(base_uri["create-dicom"].post(payload))
    end

    # GET /tools/dicom-conformance
    def dicom_conformance # DICOM conformance statement of this version of Orthanc
      base_uri["dicom-conformance"].get
    end

    # POST /tools/execute-script
    def execute_script(payload = {}) # Execute the Lua script in the POST body (experimental)
      handle_response(base_uri["execute-script"].post(payload))
    end

    # GET /tools/generate-uid
    def generate_uid(level) # "level" argument among "patient", "study", "series" and "instance"
      handle_response(base_uri["generate-uid"].get({params: {level: level}}))
    end

    # POST /tools/lookup
    def lookup(payload = {}) # Map DICOM UIDs to Orthanc identifiers
      handle_response(base_uri["lookup"].post(payload))
    end

    # GET /tools/now
    def now # Returns the current datetime in the ISO 8601 format
      base_uri["now"].get
    end

    # POST /tools/reset
    def reset(payload = {}) # Hot restart of Orthanc, the configuration file will be read again
      handle_response(base_uri["reset"].post(payload))
    end

  end
end
