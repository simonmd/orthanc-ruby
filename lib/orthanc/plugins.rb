module Orthanc
  class Plugin
    include Response
    attr_accessor :base_uri

    def initialize(id = nil)
      client = Client.new
      self.base_uri = client.base_uri["/plugins/#{id}"]
    end

    # GET /plugins/explorer.js
    def explorerjs # Get the JavaScript code that is injected by plugins into Orthanc Explorer
      handle_response(base_uri["explorer.js"].get)
    end

    # GET /plugins/{id}
    def fetch  # Fetch API response
      handle_response(base_uri.get)
    end

  end
end
