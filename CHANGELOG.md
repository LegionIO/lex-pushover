# Changelog

## [0.2.1] - 2026-03-22

### Changed
- Add legion-cache, legion-crypt, legion-data, legion-json, legion-logging, legion-settings, legion-transport as runtime dependencies
- Update spec_helper with real sub-gem helper stubs

## [0.2.0] - 2026-03-15

### Added
- Standalone `Client` class (`Legion::Extensions::Pushover::Client`) that includes all Runner modules
- `Client#initialize` accepts `user_key:` and `api_token:` keyword arguments stored in `@opts`
- `Client#find_setting` resolves credentials from per-call opts or stored `@opts`
- Specs for `Client` class covering initialization, `find_setting`, and runner method presence

## [0.1.3] - 2026-03-13

### Added
- Initial release
