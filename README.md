# lex-pushover

Pushover push notification integration for [LegionIO](https://github.com/LegionIO/LegionIO). Send notifications to Pushover-connected devices with priority levels.

## Installation

```bash
gem install lex-pushover
```

## Functions

| Function | Parameters |
|----------|-----------|
| push | message (required), title, token, user |
| emergency | message (required), title, token, user |
| high | message (required), title, token, user |
| normal | message (required), title, token, user |
| low | message (required), title, token, user |
| lowest | message (required), title, token, user |

Additional optional parameters: `priority`, `device`, `url`, `url_title`, `sound`, `expire`, `retry`, `callback`

### Example Payloads

```json
{"message": "Hello World!"}
```

```json
{"title": "Hello World!", "message": "I am a notification"}
```

## Configuration

```json
{
  "extensions": {
    "pushover": {
      "enabled": true,
      "workers": 1,
      "token": "your_token",
      "user": "your_user"
    }
  }
}
```

Token and user can also be passed per-message in the payload.

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- Pushover account

## License

MIT
