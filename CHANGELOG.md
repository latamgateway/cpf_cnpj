# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2025-12-08

### Changed
- **BREAKING**: Updated minimum Ruby version from 2.3.0 to 3.0.0
- **BREAKING**: Enhanced CPF blacklist - now rejects `01234567890` and `12345678909` which were previously considered valid
- Migrated from Travis CI to GitHub Actions
- Updated Gemfile source to use HTTPS
- Modernized RuboCop configuration for Ruby 3.0+
- Improved development dependencies with specific versioning

### Added
- `.ruby-version` file for Ruby version control
- GitHub Actions test workflow with matrix for multiple Ruby versions
- Additional gemspec metadata (bug tracker, changelog, documentation)
- Required MFA configuration for RubyGems

### Removed
- Obsolete `.travis.yml` file
- Unnecessary `pry-meta` dependency

## [1.0.0] - Previous date

### Added
- Initial functionality for CPF and CNPJ validation
- Valid number generation
- Number formatting and cleaning
- CLI tools for CPF and CNPJ
- Comprehensive tests

[Unreleased]: https://github.com/latamgateway/cpf_cnpj/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/latamgateway/cpf_cnpj/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/latamgateway/cpf_cnpj/releases/tag/v1.0.0