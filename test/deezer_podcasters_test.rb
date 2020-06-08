# frozen_string_literal: true

require "test_helper"

class DeezerPodcastersTest < Minitest::Test
  def setup
    DeezerPodcasters.configure do |config|
      config.api_key = "1234567key"
      config.provider = "megafono"
    end
  end

  def test_configuration
    assert_equal DeezerPodcasters.config.api_key, "1234567key"
    assert_equal DeezerPodcasters.config.provider, "megafono"
  end

  def test_ping
    stub_request(
      :any,
      "https://podcasters.deezer.com/api/podcast/ping"
    )
    .to_return(
      body: "{\"result\":\"OK\"}"
    )

    DeezerPodcasters.ping

    assert_requested :post,
                     "https://podcasters.deezer.com/api/podcast/ping",
                     headers: {
                       "Accept" => "application/json",
                       "Api-Key" => "1234567key",
                       "Content-Type" => "application/json",
                       "User-Agent" => "Faraday v0.17.3"
                     },
                     body: { provider: "megafono" }.to_json,
                     times: 1
  end

  def test_submission_only_required_params
    stub_request(
      :any,
      "https://podcasters.deezer.com/api/podcast/submission"
    )
    .to_return(
      body: "{\"url\":\"https:\\/\\/www.deezer.com\\/show\\/56373\"}"
    )

    DeezerPodcasters.submission(
      title: "My podcast",
      url: "https://feed.megafono.host/my_podcast"
    )

    assert_requested :post,
                     "https://podcasters.deezer.com/api/podcast/submission",
                     headers: {
                       "Accept" => "application/json",
                       "Api-Key" => "1234567key",
                       "Content-Type" => "application/json",
                       "User-Agent" => "Faraday v0.17.3"
                     },
                     body: {
                       provider: "megafono",
                       title: "My podcast",
                       url: "https://feed.megafono.host/my_podcast"
                     }.to_json,
                     times: 1
  end


  def test_submission_all_params
    stub_request(
      :any,
      "https://podcasters.deezer.com/api/podcast/submission"
    ).to_return(
      body: "{\"url\":\"https:\\/\\/www.deezer.com\\/show\\/56373\"}"
    )

    DeezerPodcasters.submission(
      title: "My podcast",
      url: "https://feed.megafono.host/my_podcast",
      country: "DE",
      genre: "Literature",
      language: "de",
      explicitStatus: false
    )

    assert_requested :post,
                     "https://podcasters.deezer.com/api/podcast/submission",
                     headers: {
                       "Accept" => "application/json",
                       "Api-Key" => "1234567key",
                       "Content-Type" => "application/json",
                       "User-Agent" => "Faraday v0.17.3"
                     },
                     body: {
                       provider: "megafono",
                       title: "My podcast",
                       url: "https://feed.megafono.host/my_podcast",
                       country: "DE",
                       genre: "Literature",
                       language: "de",
                       explicitStatus: false
                     }.to_json,
                     times: 1
  end
end
