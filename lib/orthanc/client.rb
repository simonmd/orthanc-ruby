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
    def system
      handle_response(base_uri["system"].get)
    end

    def statistics
      handle_response(base_uri["statistics"].get)
    end

    def changes(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["changes"].get({params: params}))
    end

    def delete_changes(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["changes"].delete({params: params}))
    end

    def exports(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["exports"].get({params: params}))
    end

    def delete_exports(params = {}) # "last", "limit" and "since" arguments
      handle_response(base_uri["exports"].delete({params: params}))
    end

    # ------------- Plugins -------------

    def plugins_list
      handle_response(base_uri["plugins"].get)
    end

    def plugins(id = nil)
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

    def tools
      Tool.new
    end

    # ------------- Modalities -------------

    def modalities_list
      handle_response(base_uri["modalities"].get)
    end

    def modalities(dicom = nil)
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

    def peers_list
      handle_response(base_uri["peers"].get)
    end

    def peers(peer = nil)
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

    def patients_list
      handle_response(base_uri["patients"].get)
    end

    def patients(id = nil)
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

    def studies_list
      handle_response(base_uri["studies"].get)
    end

    def studies(id = nil)
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

    def series_list
      handle_response(base_uri["series"].get)
    end

    def series(id = nil)
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

    def instances_list
      handle_response(base_uri["instances"].get)
    end

    def instances(id = nil)
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
