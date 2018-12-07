module YandexTranslator
  class Client
    module YaMethods

      def get_lang(ui)
        parameters =  {"key" => @api_key, "ui" => ui}
        Connection.post(uri('getLangs'), parameters)
      end

      def detect(text, hint='')
        parameters =  {"key" => @api_key, "text" => text, "hint" => hint}
        Connection.post(uri('detect'), parameters) ["lang"]
      end

      def translate(text, lang)
        parameters =  {"key" => @api_key, "text" => text, "lang" => lang}
        Connection.post(uri('translate'), parameters)["text"][0]
      end

      private

      def uri (path)
        URI.parse(API_HOST + "#{path}?")
      end
    end
  end
end
