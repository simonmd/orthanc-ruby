module Orthanc
  class Patient
    include Response
    attr_accessor :base_uri

    def initialize(id = nil)
      client = Client.new
      self.base_uri = client.base_uri["/patients/#{id}"]
    end

    # GET /patients, # GET /patients/{id}
    def fetch # Fetch API response
      handle_response(base_uri.get)
    end

    # DELETE /patients/{id}
    def delete
      handle_response(base_uri.delete)
    end

    # POST /patients/{id}/anonymize
    def anonymize(payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      handle_response(base_uri["anonymize"].post(payload.to_s))
    end

    # GET /patients/{id}/archive
    def archive # Create ZIP
      base_uri["archive"].get # CAREFUL! Returns the whole zipfile
    end

    # GET /patients/{id}/instances
    def instances # Retrieve all the instances of this patient in a single REST call
      handle_response(base_uri["instances"].get)
    end

    # GET /patients/{id}/media
    def media # Create a ZIP archive for media storage with DICOMDIR
      base_uri["media"].get # CAREFUL! Returns the whole zipfile
    end

    # POST /patients/{id}/modify
    def modify(payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      handle_response(base_uri["modify"].post(payload.to_s))
    end

    # GET /patients/{id}/module
    def module
      handle_response(base_uri["module"].get)
    end

    # GET /patients/{id}/protected
    def protected? # Protection against recycling: "0" means unprotected, "1" protected
      num_to_bool(base_uri["protected"].get)
    end

    # PUT /patients/{id}/protected
    def protected(boolstatus = true) # Protection against recycling: "0" means unprotected, "1" protected
      status = bool_to_num(boolstatus)
      base_uri["protected"].put("#{status}")
      return nil # API returns ""
    end

    # GET /patients/{id}/series
    def series # Retrieve all the series of this patient in a single REST call
      handle_response(base_uri["series"].get)
    end

    # GET /patients/{id}/shared-tags
    def shared_tags(params = {}) # "?simplify" argument to simplify output
      handle_response(base_uri["shared-tags"].get({params: params}))
    end

    # GET /patients/{id}/statistics
    def statistics
      handle_response(base_uri["statistics"].get)
    end

    # GET /patients/{id}/studies
    def studies # Retrieve all the studies of this patient in a single REST call
      handle_response(base_uri["studies"].get)
    end

    # ---------- Polymorphic resources ----------
    # Attachments

    # GET /{resourceType}/{id}/attachments
    def attachments_list # Orthanc endpoint response
      handle_response(base_uri["attachments"].get)
    end

    def attachments(id = nil)
      if id
        return Attachment.new(base_uri, id)
      else
        a = []
        handle_response(base_uri["attachments"].get).each do |id|
          a << Attachment.new(base_uri, id)
        end
        return a
      end
    end

    # Metadata

    # GET /{resourceType}/{id}/metadata
    def metadata_list # Orthanc endpoint response
      handle_response(base_uri["metadata"].get)
    end

    def metadata(name = nil) # As class instances, for method chaining
      if name
        return Metadata.new(base_uri, name)
      else
        a = []
        handle_response(base_uri["metadata"].get).each do |name|
          a << Metadata.new(base_uri, name)
        end
        return a
      end
    end

  end
end
