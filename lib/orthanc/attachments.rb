module Orthanc
  class Attachment
    include Response
    attr_accessor :base_uri

    def initialize(resource, id = nil)
      self.base_uri = resource["/attachments/#{id}"]
    end


    # DELETE /{resourceType}/{id}/attachments/{name}
    def delete_attachment
      handle_response(base_uri["attachments/#{name}"].delete)
    end

    # PUT /{resourceType}/{id}/attachments/{name}
    def modify(payload = {})
      handle_response(base_uri["attachments/#{name}"].put(payload))
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-data
    def compressed_data
      handle_response(base_uri["compressed-data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-md5
    def compressed_md5
      handle_response(base_uri["compressed-md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-size
    def compressed_size
      handle_response(base_uri["compressed-size"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/data
    def data
      handle_response(base_uri["data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/md5
    def md5
      handle_response(base_uri["md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/size
    def size
      handle_response(base_uri["size"].get)
    end

    # POST /{resourceType}/{id}/attachments/{name}/verify-md5
    def verify_md5
      handle_response(base_uri["verify-md5"].get)
    end

  end
end
