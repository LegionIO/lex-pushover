# lex-pushover: Pushover Notification Extension for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to the Pushover push notification service. Provides runners for sending messages to Pushover-connected devices.

**License**: MIT

## Architecture

```
Legion::Extensions::Pushover
├── Runners/
│   └── Message            # Send push notifications via Pushover
└── Helpers/
    └── Client             # Pushover client connection helper
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `pushover` (>= 3.0.0) | Pushover Ruby client |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
