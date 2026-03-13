# lex-pushover

Pushover push notification integration for [LegionIO](https://github.com/LegionIO/LegionIO). Send notifications to Pushover-connected devices with configurable priority levels.

## Installation

```bash
gem install lex-pushover
```

Or add to your Gemfile:

```ruby
gem 'lex-pushover'
```

## Runners

| Method | Priority | Description |
|--------|----------|-------------|
| `push` | default | Send a notification |
| `emergency` | 2 | Emergency priority (requires acknowledgment) |
| `high` | 1 | High priority |
| `normal` | 0 | Normal priority |
| `low` | -1 | Low priority |
| `lowest` | -2 | Lowest priority |

All methods accept: `message` (required), `title`, `token`, `user`, `device`, `url`, `url_title`, `sound`, `expire`, `retry`, `callback`.

## Example Payloads

```json
{"message": "Hello World!"}
```

```json
{"title": "Alert", "message": "Disk space low", "priority": 1}
```

## Configuration

Token and user can be set globally in Legion settings or passed per-message:

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

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- Pushover account

## License

MIT
