require 'httparty'

module ThaiPostTracking
  module ThailandPost
    class Request
      include HTTParty

      def initialize
        @token_key   = ThaiPostTracking.configuration.thailand_post_token
      end

      def response(trackings)
        body = {
          "status" => "all",
          "language" => "TH",
          "barcode" => trackings
        }

        options = {
          headers: token_header,
          body: body.to_json,
          debug_output: STDOUT
        }

        response = self.class.post(@request_url, options)

        if response&.code == 200
          response.parsed_response["response"]["items"]
        end
      end

      def token_header
        {
          Authorization: token_string,
          "Content-Type" => "application/json"
        }
      end

      def token_string
        "Token #{token}"
      end

      def token
        response = get_token
        return if response&.code != 200
        JSON.parse(response.body)["token"]
      end

      def get_token
        options = {
          headers: {
            Authorization: "Token #{ThaiPostTracking.configuration.thailand_post_token}",
            "Content-Type" => "application/json"
          }
        }

        self.class.post(@token_url, options)
      end
    end
  end
end
