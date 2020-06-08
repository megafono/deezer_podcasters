# frozen_string_literal: true

require "faraday"

module DeezerPodcasters
  class Client
    class ParseJSON < Faraday::Middleware
      def call(env)
        @app.call(env).on_complete do |env|
          env[:body] = ::JSON.parse(env[:body], object_class: OpenStruct)
        end
      end
    end

    def post(path, params = {})
      connection.post(path, encode(params))
    end

    def initialize(config:)
      @config = config
    end

    def connection
      @connection ||= Faraday.new("https://podcasters.deezer.com/api/podcast") do |f|
        f.headers["Accept"] = "application/json"
        f.headers["Content-Type"] = "application/json"
        f.headers["api_key"] = config.api_key
        f.response :json
        f.adapter :net_http
      end
    end

    private

      attr_reader :config

      def encode(params)
        JSON.dump(
          default_params.merge(
            params
          ).reject { |_, v| v.nil? }
        )
      end

      def default_params
        {
          provider: config.provider
        }
      end
  end
end

Faraday::Response.register_middleware json: -> { DeezerPodcasters::Client::ParseJSON }
