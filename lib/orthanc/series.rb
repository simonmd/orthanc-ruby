module Orthanc
  class Series
    include Response
    attr_accessor :base_uri

    def initialize(id = nil)
      client = Client.new
      self.base_uri = client.base_uri["/series/#{id}"]
    end

    # GET /series, # GET /series/{id}
    def fetch # Fetch API response
      handle_response(base_uri.get)
    end

    # DELETE /series/{id}
    def delete
      handle_response(base_uri.delete)
    end

    # POST /series/{id}/anonymize
    def anonymize(payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      handle_response(base_uri["anonymize"].post(payload.to_s))
    end

    # GET /series/{id}/archive
    def archive # Create ZIP
      base_uri["archive"].get # CAREFUL! Returns the whole zipfile
    end

    # GET /series/{id}/instances
    def instances # Retrieve all the instances of this patient in a single REST call
      handle_response(base_uri["instances"].get)
    end

    # GET /series/{id}/media
    def media # Create a ZIP archive for media storage with DICOMDIR
      base_uri["media"].get # CAREFUL! Returns the whole zipfile
    end

    # POST /series/{id}/modify
    def modify(payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      handle_response(base_uri["modify"].post(payload.to_s))
    end

    # GET /series/{id}/module
    def module
      handle_response(base_uri["module"].get)
    end

    # GET /series/{id}/patient
    def patient
      handle_response(base_uri["patient"].get)
    end

    # GET /series/{id}/shared-tags
    def shared_tags(params = {}) # "?simplify" argument to simplify output
      handle_response(base_uri["shared-tags"].get({params: params}))
    end

    # GET /series/{id}/statistics
    def statistics
      handle_response(base_uri["statistics"].get)
    end

    # GET /series/{id}/study
    def study
      handle_response(base_uri["study"].get)
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
