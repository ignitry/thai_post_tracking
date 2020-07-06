require 'httparty'
require 'rest-client'

module ThaiPostTracking
  class ThailandPost
    include HTTParty
    base_uri 'https://trackapi.thailandpost.co.th'

    def initialize
      @token_key = ThaiPostTracking.configuration.thailand_post_token
    end

    def get_items(trackings)
      response = get_token
      return if response&.code != 200
      token = JSON.parse(response.body)["token"]

      puts "Token: #{token}"

      body = {
        "status" => "all",
        "language" => "TH",
        "barcode" => trackings
      }

      authorization = "Token #{token}"

      headers = {
        Authorization: authorization,
        "Content-Type" => "application/json"
      }

      options = {
        headers: headers,
        body: body.to_json,
        debug_output: STDOUT
      }

      self.class.post("/post/api/v1/track", options)
    end

    def get_token
      options = {
        headers: {
          Authorization: "Token #{ThaiPostTracking.configuration.thailand_post_token}",
          "Content-Type" => "application/json"
        }
      }

      self.class.post("/post/api/v1/authenticate/token", options)
    end
  end
end
