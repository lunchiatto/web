# Changelog
All notable changes to Lunchiatto will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Renamed database from codequestmanager to lunchiatto
- Updated rails to 5.1.4 and other gems too
- Move root page and InvitationsController#show to JS therefore removing backend views
- Used docker-compose file version 3.3
- Migrated from Codeship to Codefresh
- Don't default to docker-based development setup

### Removed
- Removed `Company` abstraction from the app
- Removed `subtract_from_self` feature from Users
- Removed `slim` templating engine
- Removed `gon` as a dependency

### Fixed
- Hide transfer action buttons when request is mid-air to prevent double clicks

## [1.0.0] - 2017-06-06
### Added
- All Lunchiatto's features up to this point
- Add a `URL_HOST` environment variable to support custom urls on production

### Changed
- Migrated to a new payment model

[Unreleased]: https://github.com/lunchiatto/web/compare/1.0.0...HEAD
[1.0.0]: https://github.com/lunchiatto/web/tree/1.0.0
