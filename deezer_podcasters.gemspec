require_relative 'lib/deezer_podcasters/version'

Gem::Specification.new do |spec|
  spec.name          = "deezer_podcasters"
  spec.version       = DeezerPodcasters::VERSION
  spec.authors       = ["Emerson Almeida"]
  spec.email         = ["emerson@megafono.host"]

  spec.summary       = %q{Deezer podcasters submission}
  spec.description   = %q{SDK to handler with deezer podcasters submission api}
  spec.homepage      = "https://github.com/megafono/deezer_podcasters"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "zeitwerk"

  spec.add_development_dependency "byebug"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "minitest", "~> 5.0"
end
