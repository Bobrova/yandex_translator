module YandexTranslator
  module Errors
    class ApiErrors < StandardError

      attr_reader :response

      def initialize(response)
          @response = response
          super(response)
      end
    end

  class YandexAuthorizationError < ApiErrors; end
  class YandexMethodError < ApiErrors; end
  class YandexLimitError < ApiErrors; end

  end
end
