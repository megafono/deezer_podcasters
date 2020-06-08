# Deezer Podcasters

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/deezer_podcasters`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deezer_podcasters'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install deezer_podcasters

## Usage

### Configuration

You need to configure the `api_key` and `provider`.

```
DeezerPodcasters.configure do |config|
  config.api_key = "1234567key"
  config.provider = "megafono"
end
```

### Operations

#### Ping

To use the **ping** operation, just call the `.ping`, e.g:

```
DeezerPodcasters.ping
```
#### Submission

To submit a podcast to call the `.submission`, e.g:

```
DeezerPodcasters.submission(
  title: "My podcast",
  url: "https://feed.megafono.host/my_podcast",
  country: "DE",
  genre: "Literature",
  language: "de",
  explicitStatus: false
)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/megafono/deezer_podcasters. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/megafono/deezer_podcasters/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DeezerPodcasters project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/megafono/deezer_podcasters/blob/master/CODE_OF_CONDUCT.md).
