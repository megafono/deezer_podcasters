module DeezerPodcasters
  module Operations
    def ping
      client.post("ping")
    end

    def submission(title:, url:, country: nil, genre: nil, language: nil, explicitStatus: nil)
      client.post(
        "submission",
        title: title,
        url: url,
        country: country,
        genre: genre,
        language: language,
        explicitStatus: explicitStatus
      )
    end
  end
end
