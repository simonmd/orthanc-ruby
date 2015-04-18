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

    def plugins
      plugins_array = []
      handle_response(base_uri["plugins"].get).each do |id|
        plugins_array << Plugin.new(id)
      end
      return plugins_array
    end

    def plugin(id)
      Plugin.new(id)
    end

    # ------------- Tools -------------

    def tools
      Tool.new
    end

    # ------------- Modalities -------------

    def modalities_list
      handle_response(base_uri["modalities"].get)
    end

    def modalities
      modalities_array = []
      handle_response(base_uri["modalities"].get).each do |id|
        modalities_array << Modality.new(id)
      end
      return modalities_array
    end

    def modality(dicom)
      Modality.new(dicom)
    end

    # ------------- Modalities -------------

    def peers_list
      handle_response(base_uri["peers"].get)
    end

    def peers
      peers_array = []
      handle_response(base_uri["peers"].get).each do |id|
        peers_array << Peer.new(id)
      end
      return peers_array
    end

    def peer(peer)
      Peer.new(peer)
    end

    # ------------- Patients -------------

    def patients_list
      handle_response(base_uri["patients"].get)
    end

    def patients
      patients_array = []
      handle_response(base_uri["patients"].get).each do |id|
        patients_array << Patient.new(id)
      end
      return patients_array
    end

    def patient(id)
      Patient.new(id)
    end

    # ------------- Studies -------------

    def studies_list
      handle_response(base_uri["studies"].get)
    end

    def studies
      studies_array = []
      handle_response(base_uri["studies"].get).each do |id|
        studies_array << Study.new(id)
      end
      return studies_array
    end

    def study(id)
      Study.new(id)
    end

    # ------------- Series -------------

    def series_list
      handle_response(base_uri["series"].get)
    end

    def all_series
      series_array = []
      handle_response(base_uri["series"].get).each do |id|
        series_array << Series.new(id)
      end
      return series_array
    end

    def series(id)
      Series.new(id)
    end

    # ------------- Instances -------------

    def instances_list
      handle_response(base_uri["instances"].get)
    end

    def instances
      instances_array = []
      handle_response(base_uri["instances"].get).each do |id|
        instances_array << Instance.new(id)
      end
      return instances_array
    end

    def instance(id)
      Instance.new(id)
    end

  end
end
