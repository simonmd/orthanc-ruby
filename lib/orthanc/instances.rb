module Orthanc
  class Instance
    include Response
    attr_accessor :base_uri

    def initialize(id = nil)
      client = Client.new
      self.base_uri = client.base_uri["/instances/#{id}"]
    end

    # GET /instances, # GET /instances/{id}
    def fetch # Fetch API response
      handle_response(base_uri.get)
    end

    # DELETE /instances/{id}
    def delete
      handle_response(base_uri.delete)
    end

    # POST /instances/{id}/anonymize
    def anonymize(payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      base_uri["anonymize"].post(payload.to_s)
    end

    # GET /instances/{id}/content/
    def content # List the first-level DICOM tags
      handle_response(base_uri["frames"].get)
    end

    # GET /instances/{id}/content/{group}-{element}
    def content_tag(group, element) # Raw access to the value of DICOM tags (comprising the padding character)
      handle_response(base_uri["content/#{group}-#{element}"].get)
    end

    # GET /instances/{id}/content/{group}-{element}/{index}/...
    def content_sequence(group, element, index) # Raw access to the content of DICOM sequences
      handle_response(base_uri["content/#{group}-#{element}/#{index}"].get)
    end

    # POST /instances/{id}/export
    def export(payload = {}) # Write the DICOM file in the filesystem where Orthanc is running
      base_uri["export"].post(payload)
    end

    # GET /instances/{id}/file
    def file
      base_uri["file"].get
    end

    # GET /instances/{id}/frames
    def frames # Instance frames array
      handle_response(base_uri["frames"].get)
    end

    # GET /instances/{id}/frames/{frameNumber}/image-int16
    def frame_image_int16(frame_number) # Truncated image to the [-32768;32767] range
      base_uri["frames/#{frame_number}/image-int16"].get
    end

    # GET /instances/{id}/frames/{frameNumber}/image-uint16
    def frame_image_uint16(frame_number) # Truncated image to the [0;65535] range
      base_uri["frames/#{frame_number}/image-uint16"].get
    end

    # GET /instances/{id}/frames/{frameNumber}/image-uint8
    def frame_image_uint8(frame_number) # Truncated image to the [0;255] range
      base_uri["frames/#{frame_number}/image-uint8"].get
    end

    # GET /instances/{id}/frames/{frameNumber}/matlab
    def frame_matlab(frame_number) # a = eval(urlread('http://localhost:8042/instances/.../matlab'))
      base_uri["frames/#{frame_number}/matlab"].get
    end

    # GET /instances/{id}/frames/{frameNumber}/preview
    def preview(frame_number) # Rescaled image (so that all the range [0;255] is used)
      base_uri["frames/#{frame_number}/preview"].get
    end

    # GET /instances/{id}/image-int16
    def image_int16 # Truncated image to the [-32768;32767] range
      base_uri["image-int16"].get
    end

    # GET /instances/{id}/image-uint16
    def image_uint16 # Truncated image to the [0;65535] range
      base_uri["image-uint16"].get
    end

    # GET /instances/{id}/image-uint8
    def image_uint8 # Truncated image to the [0;255] range
      base_uri["image-uint8"].get
    end

    # GET /instances/{id}/matlab
    def matlab # a = eval(urlread('http://localhost:8042/instances/.../matlab'))
      base_uri["matlab"].get
    end

    # POST /instances/{id}/modify
    def modify(payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      base_uri["modify"].post(payload.to_s)
    end

    # GET /instances/{id}/module
    def module
      handle_response(base_uri["module"].get)
    end

    # GET /instances/{id}/patient
    def patient
      handle_response(base_uri["patient"].get)
    end

    # GET /instances/{id}/preview
    def preview # Rescaled image (so that all the range [0;255] is used)
      handle_response(base_uri["preview"].get)
    end

    # GET /instances/{id}/series
    def series
      handle_response(base_uri["series"].get)
    end

    # GET /instances/{id}/simplified-tags
    def simplified_tags(params = {}) # "?simplify" argument to simplify output
      handle_response(base_uri["simplified-tags"].get({params: params}))
    end

    # GET /instances/{id}/statistics
    def statistics
      handle_response(base_uri["statistics"].get)
    end

    # GET /instances/{id}/study
    def study
      handle_response(base_uri["study"].get)
    end

    # GET /instances/{id}/tags
    def tags(params = {}) # TODO: "?simplify" argument to simplify output (same as "simplified-tags")
      handle_response(base_uri["tags"].get({params: params}))
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
