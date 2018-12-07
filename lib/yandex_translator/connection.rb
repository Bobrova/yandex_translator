module YandexTranslator
  class Connection

    def self.post(path, parameters)
      response = Net::HTTP.post_form(path, parameters)
      check_errors(response)
    end

    def self.get(path, parameters)
      response = Net::HTTP.get(path, parameters)
      check_errors(response)
    end

    def self.check_errors(response)
      if response.code != "200"
        raise Errors::YandexAuthorizationError.new(JSON.parse(response.body)["message"])
      else
        JSON.parse(response.body)
      end
    end
  end
end
