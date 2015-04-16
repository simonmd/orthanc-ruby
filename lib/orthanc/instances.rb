module Orthanc
  class Client
    # ------------- Instances -------------

    # GET /instances
    def all_instances
      objectify(base_uri["instances"].get)
    end

    # POST /instances
    def instances(dicom_file) # POST = Add the new DICOM file given in the POST body
      objectify(base_uri["instances"].post(dicom_file))
    end

    # GET /instances/{id}
    def instance(id)
      objectify(base_uri["instances/#{id}"].get)
    end

    # DELETE /instances/{id}
    def delete_instance(id)
      objectify(base_uri["instances/#{id}"].delete)
    end

    # POST /instances/{id}/anonymize
    def anonymize_instance(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      objectify(base_uri["instances/#{id}/anonymize"].post(payload))
    end

    # GET /instances/{id}/content/
    def instance_content(id) # List the first-level DICOM tags
      objectify(base_uri["instances/#{id}/frames"].get)
    end

    # GET /instances/{id}/content/{group}-{element}
    def instance_content_tag(id, group, element) # Raw access to the value of DICOM tags (comprising the padding character)
      objectify(base_uri["instances/#{id}/content/#{group}-#{element}"].get)
    end

    # GET /instances/{id}/content/{group}-{element}/{index}/...
    def instance_content_sequence(id, group, element, index) # Raw access to the content of DICOM sequences
      objectify(base_uri["instances/#{id}/content/#{group}-#{element}/#{index}"].get)
    end

    # POST /instances/{id}/export
    def instance_export(id) # Write the DICOM file in the filesystem where Orthanc is running
      objectify(base_uri["instances/#{id}/export"].post)
    end   

    # GET /instances/{id}/file
    def instance_file(id)
      objectify(base_uri["instances/#{id}/file"].get)
    end 

    # GET /instances/{id}/frames
    def instance_frames(id) # Instance frames array
      objectify(base_uri["instances/#{id}/frames"].get)
    end    

    # GET /instances/{id}/frames/{frameNumber}/image-int16
    def instance_frame_image_int16(id, frame_number) # Truncated image to the [-32768;32767] range
      objectify(base_uri["instances/#{id}/frames/#{frame_number}/image-int16"].get)
    end

    # GET /instances/{id}/frames/{frameNumber}/image-uint16
    def instance_frame_image_uint16(id, frame_number) # Truncated image to the [0;65535] range
      objectify(base_uri["instances/#{id}/frames/#{frame_number}/image-uint16"].get)
    end

    # GET /instances/{id}/frames/{frameNumber}/image-uint8
    def instance_frame_image_uint8(id, frame_number) # Truncated image to the [0;255] range
      objectify(base_uri["instances/#{id}/frames/#{frame_number}/image-uint8"].get)
    end

    # GET /instances/{id}/frames/{frameNumber}/matlab
    def instance_frame_matlab(id, frame_number) # a = eval(urlread('http://localhost:8042/instances/.../matlab'))
      objectify(base_uri["instances/#{id}/frames/#{frame_number}/matlab"].get)
    end

    # GET /instances/{id}/frames/{frameNumber}/preview
    def instance_preview(id, frame_number) # Rescaled image (so that all the range [0;255] is used)
      objectify(base_uri["instances/#{id}/frames/#{frame_number}/preview"].get)
    end

    # GET /instances/{id}/image-int16
    def instance_image_int16(id) # Truncated image to the [-32768;32767] range
      objectify(base_uri["instances/#{id}/image-int16"].get)
    end

    # GET /instances/{id}/image-uint16
    def instance_image_uint16(id) # Truncated image to the [0;65535] range
      objectify(base_uri["instances/#{id}/image-uint16"].get)
    end

    # GET /instances/{id}/image-uint8
    def instance_image_uint8(id) # Truncated image to the [0;255] range
      objectify(base_uri["instances/#{id}/image-uint8"].get)
    end

    # GET /instances/{id}/matlab
    def instance_matlab(id) # a = eval(urlread('http://localhost:8042/instances/.../matlab'))
      objectify(base_uri["instances/#{id}/matlab"].get)
    end

    # POST /instances/{id}/modify
    def modify_instance(id, payload = {}) # https://code.google.com/p/orthanc/wiki/Anonymization
      objectify(base_uri["instances/#{id}/modify"].post(payload))
    end

    # GET /instances/{id}/module
    def instance_module(id)
      objectify(base_uri["instances/#{id}/module"].get)
    end

    # GET /instances/{id}/patient
    def instance_patient(id)
      objectify(base_uri["instances/#{id}/patient"].get)
    end

    # GET /instances/{id}/preview
    def instance_preview(id) # Rescaled image (so that all the range [0;255] is used)
      objectify(base_uri["instances/#{id}/preview"].get)
    end

    # GET /instances/{id}/series
    def instance_series(id)
      objectify(base_uri["instances/#{id}/series"].get)
    end

    # GET /instances/{id}/simplified-tags
    def instance_shared_tags(id) # "?simplify" argument to simplify output
      objectify(base_uri["instances/#{id}/shared-tags"].get)
    end

    # GET /instances/{id}/statistics
    def instance_statistics(id)
      objectify(base_uri["instances/#{id}/statistics"].get)
    end

    # GET /instances/{id}/study
    def instance_study(id)
      objectify(base_uri["instances/#{id}/study"].get)
    end

    # GET /instances/{id}/tags
    def instance_tags(id) # TODO: "?simplify" argument to simplify output (same as "simplified-tags")
      objectify(base_uri["instances/#{id}/tags"].get)
    end

    # TODO: Polymorphic resourceType resources. Repetitive. must refactor

    # GET /{resourceType}/{id}/attachments
    def instance_attachments(id)
      objectify(base_uri["instances/#{id}/attachments"].get)
    end

    # DELETE /{resourceType}/{id}/attachments/{name}
    def delete_instance_attachment(id, name)
      objectify(base_uri["instances/#{id}/attachments/#{name}"].delete)
    end

    # PUT /{resourceType}/{id}/attachments/{name}
    def instance_attachment(id, name, payload = {})
      objectify(base_uri["instances/#{id}/attachments/#{name}"].put(payload))
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-data
    def instance_attachment_compressed_data(id, name)
      objectify(base_uri["instances/#{id}/attachments/#{name}/compressed-data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-md5
    def instance_attachment_compressed_md5(id, name)
      objectify(base_uri["instances/#{id}/attachments/#{name}/compressed-md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/compressed-size
    def instance_attachment_compressed_size(id, name)
      objectify(base_uri["instances/#{id}/attachments/#{name}/compressed-size"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/data
    def instance_attachment_data(id, name)
      objectify(base_uri["instances/#{id}/attachments/#{name}/data"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/md5
    def instance_attachment_md5(id, name)
      objectify(base_uri["instances/#{id}/attachments/#{name}/md5"].get)
    end

    # GET /{resourceType}/{id}/attachments/{name}/size
    def instance_attachment_size(id, name)
      objectify(base_uri["instances/#{id}/attachments/#{name}/size"].get)
    end

    # POST /{resourceType}/{id}/attachments/{name}/verify-md5
    def instance_attachment_verify_md5(id, name)
      objectify(base_uri["instances/#{id}/attachments/#{name}/verify-md5"].get)
    end

    # GET /{resourceType}/{id}/metadata
    def instance_all_metadata(id)
      objectify(base_uri["instances/#{id}/metadata"].get)
    end

    # GET /{resourceType}/{id}/metadata/{name}
    def instance_metadata(id, name)
      objectify(base_uri["instances/#{id}/metadata/#{name}"].get)
    end

    # DELETE /{resourceType}/{id}/metadata/{name}
    def instance_delete_metadata(id, name)
      objectify(base_uri["instances/#{id}/metadata/#{name}"].delete)
    end

    # PUT /{resourceType}/{id}/metadata/{name}
    def instance_update_metadata(id, name, payload = {})
      objectify(base_uri["instances/#{id}/metadata/#{name}"].put(payload))
    end

  end
end