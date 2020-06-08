require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

module DeezerPodcasters
  extend Operations

  class << self
    def client
      @client ||= Client.new(config: config)
    end

    def configure
      yield config
    end

    def config
      @config ||= Configuration.new
    end
  end
end
