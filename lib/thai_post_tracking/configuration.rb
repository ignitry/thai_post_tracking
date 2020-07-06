require_relative 'version'

module ThaiPostTracking
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :thailand_post_token
    attr_reader :version

    def initialize
      @version = VERSION
      @thailand_post_token_key = "replace-with-your-token"
    end
  end
end
