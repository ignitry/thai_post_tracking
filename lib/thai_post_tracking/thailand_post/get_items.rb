module ThaiPostTracking
  module ThailandPost
    class GetItems < Request
      base_uri 'https://trackapi.thailandpost.co.th'

      def initialize
        @token_url   = "/post/api/v1/authenticate/token"
        @request_url = "/post/api/v1/track"
      end
    end
  end
end
