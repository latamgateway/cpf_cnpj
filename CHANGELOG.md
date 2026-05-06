# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.1.0] - 2026-05-06

### Added
- Support for alphanumeric CNPJ (format `XX.XXX.XXX/XXXX-DD` where X = A-Z or 0-9, D = 0-9)
- Validation of new alphanumeric CNPJ using ASCII-based check digit algorithm per Receita Federal specification
- Case-insensitive validation for alphanumeric CNPJs
- Formatting support for alphanumeric CNPJs

### Changed
- `CNPJ::VerifierDigit.generate` now accepts character arrays (strings) in addition to integers
- `CNPJ::Formatter` updated to preserve alphabetic characters during strip/format operations
- Verified compatibility with Ruby 2.7 through 3.4.x

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

[Unreleased]: https://github.com/latamgateway/cpf_cnpj/compare/v2.1.0...HEAD
[2.1.0]: https://github.com/latamgateway/cpf_cnpj/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/latamgateway/cpf_cnpj/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/latamgateway/cpf_cnpj/releases/tag/v1.0.0