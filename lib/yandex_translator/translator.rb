require "net/http"
require "uri"
require "json"

module YandexTranslator
  
  class ApiError < StandardError
  end
  class Translator

    def initialize(api_key)
      @api_key = api_key
    end

    def request(uri, parameters)
      response = Net::HTTP.post_form(uri, parameters)
      if response.code== "200"
        JSON.parse(response.body)
      else
        raise ApiError.new(JSON.parse(response.body)["message"])
      end
    end

    def get_lang(ui)
      uri = URI.parse("https://translate.yandex.net/api/v1.5/tr.json/getLangs?key=#{@api_key}&")
      parameters =  {"ui" => ui}
      request(uri, parameters) 
    end

    def detect(text, hint='')
      uri = URI.parse("https://translate.yandex.net/api/v1.5/tr.json/detect?key=#{@api_key}&")
      parameters =  {"text" => text, "hint" => hint}
      request(uri, parameters) ["lang"]
    end

    def translate(text, lang)
      uri = URI.parse("https://translate.yandex.net/api/v1.5/tr.json/translate?key=#{@api_key}&")
      parameters =  {"text" => text, "lang" => lang}
      request(uri, parameters)["text"][0]
    end

  end
end