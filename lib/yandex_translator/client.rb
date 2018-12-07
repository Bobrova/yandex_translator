require_relative 'connection'
require_relative 'apiMethods/yaMethods'
require_relative 'errors'
module YandexTranslator

  class Client
    include YandexTranslator::Client::YaMethods

    API_HOST = "https://translate.yandex.net/api/v1.5/tr.json/"

    def initialize(api_key)
      @api_key = api_key
    end

    # def request(req, path, parameters)
    #   url = URI.parse(API_HOST + "#{path}?")
    #   case req
    #   when 'post'
    #     Connection.post(url, parameters)
    #   when 'get'
    #     Connection.get(url, parameters)
    #   end
    # end

  end

end
