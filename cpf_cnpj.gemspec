# frozen_string_literal: true

require "./lib/cpf_cnpj/version"

Gem::Specification.new do |spec|
  spec.authors       = ["Gowd Instituição de Pagamentos Ltda"]
  spec.email         = ["engineering@gowd.com"]
  spec.description   = "Validate, generate and format CPF/CNPJ numbers. " \
                       "Include command-line tools."
  spec.summary       = spec.description
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")
  spec.homepage = "https://github.com/latamgateway/cpf_cnpj"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://rubydoc.info/gems/cpf_cnpj"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.glob("lib/**/*") + Dir.glob("bin/*") +
               %w[
                 Gemfile README.md CHANGELOG.md LICENSE Rakefile
                 cpf_cnpj.gemspec
               ]
  spec.executables   = Dir.glob("bin/*").map {|f| File.basename(f) }
  spec.name          = "cpf_cnpj"
  spec.require_paths = ["lib"]
  spec.version = CPF::VERSION

  spec.add_development_dependency "minitest-utils", "~> 0.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 1.50"
  spec.add_development_dependency "rubocop-fnando", "~> 0.0"
  spec.add_development_dependency "simplecov", "~> 0.22"
end
