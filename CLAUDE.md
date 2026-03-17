# lex-pushover: Pushover Notification Extension for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to the Pushover push notification service. Provides runners for sending messages to Pushover-connected devices with configurable priority levels.

**GitHub**: https://github.com/LegionIO/lex-pushover
**License**: MIT
**Version**: 0.2.0

## Architecture

```
Legion::Extensions::Pushover
├── Client                 # Standalone client: includes all runners + helpers; accepts user_key/api_token kwargs
├── Runners/
│   └── Message            # Priority-based push notifications
└── Helpers/
    └── Client             # Pushover::Message builder (token, user from settings)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/pushover.rb` | Entry point, extension registration |
| `lib/legion/extensions/pushover/client.rb` | Standalone client; includes Helpers::Client + Runners::Message |
| `lib/legion/extensions/pushover/runners/message.rb` | push, emergency, high, normal, low, lowest |
| `lib/legion/extensions/pushover/helpers/client.rb` | Pushover message factory, reads token/user from settings |

## Runner: Message

| Method | Priority | Description |
|--------|----------|-------------|
| `push` | default | Send a notification |
| `emergency` | 2 | Emergency priority (requires ack) |
| `high` | 1 | High priority |
| `normal` | 0 | Normal priority |
| `low` | -1 | Low priority |
| `lowest` | -2 | Lowest priority |

All methods accept `message:` (required), `title:`, `token:`, `user:`, `device:`, `url:`, `url_title:`, `sound:`, `expire:`, `retry:`, `callback:`.

## Standalone Usage

`Legion::Extensions::Pushover::Client` can be used outside the Legion runtime by instantiating it directly:

```ruby
client = Legion::Extensions::Pushover::Client.new(user_key: 'uXXX', api_token: 'aXXX')
client.push(message: 'Deploy complete')
client.high(message: 'Disk usage above 90%', title: 'Alert')
```

Credentials passed at construction are merged with per-call kwargs; per-call values take precedence.

## Configuration

Token and user can be set globally in Legion settings or passed per-message in the payload:

```json
{
  "extensions": {
    "pushover": {
      "enabled": true,
      "token": "your_app_token",
      "user": "your_user_key"
    }
  }
}
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `pushover` (>= 3.0.0) | Pushover Ruby client |

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
