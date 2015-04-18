module Orthanc
  class Series
    include Response
    attr_accessor :base_uri

    def initialize(id = nil)
      client = Client.new
      self.base_uri = client.base_uri["/series/#{id}"]
    end

    # GET /series, # GET /series/{id}
    def fetch
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
    def shared_tags # "?simplify" argument to simplify output
      handle_response(base_uri["shared-tags"].get)
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
    def attachments_list
      handle_response(base_uri["attachments"].get)
    end

    def attachments
      attachments_array = []
      handle_response(base_uri["attachments"].get).each do |id|
        attachments_array << Attachment.new(base_uri, id)
      end
      return attachments_array
    end

    def attachment(id)
      Plugin.new(base_uri, id)
    end


    # Metadata

    # GET /{resourceType}/{id}/metadata
    def metadata_list
      handle_response(base_uri["metadata"].get)
    end

    def all_metadata
      metadata_array = []
      handle_response(base_uri["metadata"].get).each do |name|
        metadata_array << Metadata.new(base_uri, name)
      end
      return metadata_array
    end

    def metadata(name)
      Metadata.new(base_uri, name)
    end

  end
end
