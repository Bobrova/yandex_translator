require_relative 'errors'
module YandexTranslator
  class Connection

      def self.post(path, parameters)
        response = Net::HTTP.post_form(path, parameters)
        if response.code == "200"
          JSON.parse(response.body)
        else
          raise Errors::YandexAuthorizationError.new(JSON.parse(response.body)["message"])
        end
      end


    end
  end
