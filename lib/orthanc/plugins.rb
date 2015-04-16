module Orthanc
  class Client
    # ------------- Plugins -------------
    # GET /plugins
    def plugins # Get the list of all the registered plugins
      objectify(base_uri["plugins"].get)
    end

    # GET /plugins/explorer.js
    def plugins_explorerjs # Get the JavaScript code that is injected by plugins into Orthanc Explorer
      objectify(base_uri["plugins/explorer.js"].get) 
    end

    # GET /plugins/{id}
    def plugin(id) # Get information about some plugin
      objectify(base_uri["plugins/#{id}"].get)
    end    

  end
end