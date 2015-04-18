module Response

    def bool_to_num(bool)
      return 0 if bool == false
      return 1 if bool == true
    end

    def num_to_bool(num)
      return false if num == "0"
      return true if num == "1"
    end

    def handle_response(response)
      begin
        # Try to parse response
        parsed_response = JSON.parse(response)

        if parsed_response.class == Array
          return parsed_response
        elsif parsed_response.class == Hash
          return RecursiveOpenStruct.new(parsed_response.to_snake_keys, recurse_over_arrays: true )
        else
          return response
        end
      rescue JSON::ParserError => e # If JSON parse fails, return original response
        return response
      end
    end

end
