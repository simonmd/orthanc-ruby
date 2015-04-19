require 'orthanc/response'

require 'orthanc/tools'
require 'orthanc/plugins'
require 'orthanc/modalities'
require 'orthanc/peers'
require 'orthanc/patients'
require 'orthanc/studies'
require 'orthanc/series'
require 'orthanc/instances'
require 'orthanc/attachments'
require 'orthanc/metadata'

module Orthanc
  class Client

    include Response
    attr_accessor :base_uri

    def initialize(host = "localhost", port = 8042)
      self.base_uri = RestClient::Resource.new("http://#{host}:#{port}")
    end

    # ------------- General -------------

    # GET /system
    def system
      handle_response(base_uri["system"].get)
    end

    # GET /statistics
    def statistics
      handle_response(base_uri["statistics"].get)
    end

    # GET /changes
    def changes(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["changes"].get({params: params}))
    end

    # DELETE /changes
    def delete_changes(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["changes"].delete({params: params}))
    end

    # GET /exports
    def exports(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["exports"].get({params: params}))
    end

    # DELETE /exports
    def delete_exports(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["exports"].delete({params: params}))
    end


    # ------------- Plugins -------------

    # GET /plugins
    def plugins_list # Orthanc endpoint response
      handle_response(base_uri["plugins"].get)
    end

    # GET /plugins
    def plugins(id = nil) # As class instances, for method chaining
      if id
        return Plugin.new(id)
      else
        a = []
        handle_response(base_uri["plugins"].get).each do |id|
          a << Plugin.new(id)
        end
        return a
      end
    end


    # ------------- Tools -------------

    # GET /tools
    def tools
      Tool.new
    end


    # ------------- Modalities -------------

    def modalities_list # Orthanc endpoint response
      handle_response(base_uri["modalities"].get)
    end

    def modalities(dicom = nil) # As class instances, for method chaining
      if dicom
        return Modality.new(dicom)
      else
        a = []
        handle_response(base_uri["modalities"].get).each do |dicom|
          a << Modality.new(dicom)
        end
        return a
      end
    end


    # ------------- Modalities -------------

    def peers_list # Orthanc endpoint response
      handle_response(base_uri["peers"].get)
    end

    def peers(peer = nil) # As class instances, for method chaining
      if peer
        return Peer.new(peer)
      else
        a = []
        handle_response(base_uri["peers"].get).each do |peer|
          a << Peer.new(peer)
        end
        return a
      end
    end


    # ------------- Patients -------------

    def patients_list # Orthanc endpoint response
      handle_response(base_uri["patients"].get)
    end

    def patients(id = nil) # As class instances, for method chaining
      if id
        return Patient.new(id)
      else
        a = []
        handle_response(base_uri["patients"].get).each do |id|
          a << Patient.new(id)
        end
        return a
      end
    end


    # ------------- Studies -------------

    def studies_list # Orthanc endpoint response
      handle_response(base_uri["studies"].get)
    end

    def studies(id = nil) # As class instances, for method chaining
      if id
        return Study.new(id)
      else
        a = []
        handle_response(base_uri["studies"].get).each do |id|
          a << Study.new(id)
        end
        return a
      end
    end


    # ------------- Series -------------

    def series_list # Orthanc endpoint response
      handle_response(base_uri["series"].get)
    end

    def series(id = nil) # As class instances, for method chaining
      if id
        return Series.new(id)
      else
        a = []
        handle_response(base_uri["series"].get).each do |id|
          a << Series.new(id)
        end
        return a
      end
    end


    # ------------- Instances -------------

    def instances_list # Orthanc endpoint response
      handle_response(base_uri["instances"].get)
    end

    def instances(id = nil) # As class instances, for method chaining
      if id
        return Instance.new(id)
      else
        a = []
        handle_response(base_uri["instances"].get).each do |id|
          a << Instance.new(id)
        end
        return a
      end
    end

  end
end
