module ThaiPostTracking
  module ThailandPost
    class HookItems < Request
      base_uri 'https://trackwebhook.thailandpost.co.th'

      def initialize
        @token_url   = "/post/api/v1/authenticate/token"
        @request_url = "/post/api/v1/hook"
      end
    end
  end
end
