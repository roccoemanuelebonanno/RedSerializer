# frozen_string_literal: true

require_relative "lib/red_serializer/version"

Gem::Specification.new do |spec|
  spec.name = "red_serializer"
  spec.version = RedSerializer::VERSION
  spec.authors = ["Rocco Emanuele Bonanno"]
  spec.email = ["roccoemanuelebonanno@live.it"]
  spec.summary = "RedSerializer is a versatile Ruby gem designed to streamline data serialization tasks within Ruby applications. With its intuitive interface and robust functionality, RedSerializer simplifies the conversion of complex Ruby objects into formats suitable for storage or transmission, and vice versa. Built with performance and reliability in mind, it offers developers a seamless solution for managing data serialization efficiently. Whether you're storing data persistently or transmitting it across systems, RedSerializer provides the tools needed to ensure smooth and reliable data handling within your Ruby projects." # rubocop:disable Layout/LineLength
  spec.homepage = "https://github.com/roccoemanuelebonanno/RedSerializer"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/roccoemanuelebonanno/RedSerializer"
  spec.metadata["changelog_uri"] = "https://github.com/roccoemanuelebonanno/RedSerializer/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
