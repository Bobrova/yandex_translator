module YandexTranslator
  class Client
    module YaMethods
      def get_lang(ui)
        parameters =  {"key" => @api_key, "ui" => ui}
        request('post', 'getLangs', parameters)
      end

      def detect(text, hint='')
        parameters =  {"key" => @api_key, "text" => text, "hint" => hint}
        request('post', 'detect', parameters) ["lang"]
      end

      def translate(text, lang)
        parameters =  {"key" => @api_key, "text" => text, "lang" => lang}
        request('post', 'translate', parameters)["text"][0]
      end
    end
  end
end
