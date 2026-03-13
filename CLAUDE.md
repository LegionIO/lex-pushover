# lex-pushover: Pushover Notification Extension for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to the Pushover push notification service. Provides runners for sending messages to Pushover-connected devices with configurable priority levels.

**GitHub**: https://github.com/LegionIO/lex-pushover
**License**: MIT

## Architecture

```
Legion::Extensions::Pushover
├── Runners/
│   └── Message            # Priority-based push notifications
└── Helpers/
    └── Client             # Pushover::Message builder (token, user from settings)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/pushover.rb` | Entry point, extension registration |
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
