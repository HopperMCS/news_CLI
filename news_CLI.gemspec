require_relative 'lib/news_CLI/version'

Gem::Specification.new do |spec|
  spec.name          = "news_CLI"
  spec.version       = NewsCLI::VERSION
  spec.authors       = ["M. Gage Morgan"]
  spec.email         = ["gage@gages.blog"]

  spec.summary       = %q{News Retrieval Tool}
  spec.description   = %q{Retrieves recent news from a list of publishers}
  spec.homepage      = "https://github.com/MGageMorgan/news_CLI"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.executables   = ["news-cli"]
  spec.require_paths = ["lib"]

  spec.add_dependency "json"
end
