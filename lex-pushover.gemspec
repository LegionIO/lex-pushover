# frozen_string_literal: true

require_relative 'lib/legion/extensions/pushover/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-pushover'
  spec.version       = Legion::Extensions::Pushover::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::Pushover'
  spec.description   = 'Used to connect Legion to Pushover'
  spec.homepage      = 'https://github.com/LegionIO/lex-pushover'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/LegionIO/lex-pushover'
  spec.metadata['changelog_uri'] = 'https://github.com/LegionIO/lex-pushover/blob/main/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'pushover', '>= 3.0.0'
end
