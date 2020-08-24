# Legion::Extensions::Pushover

A Legion Extension designed to connect Legion to Pushover

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lex-pushover'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install lex-pushover

## Adding to Legion
You can manually install with a `gem install lex-pushover` command or by adding it into your settings with something like this
```json
{
  "extensions": {
    "pushover": {
      "enabled": true,
      "workers": 1,
      "token": "___token___", # optional and can be passed in via the payload
      "user": "user" # optional and can be passed in via the payload
    }
  }
}
```

## Usage
There is only a single runner in this LEX. It can make the following calls 
##### Functions
|function|message|title|token|user|
|---|---|---|---|---|
|push     |Required|Optional|Optional|Optional
|emergency|Required|Optional|Optional|Optional
|high     |Required|Optional|Optional|Optional
|normal   |Required|Optional|Optional|Optional
|low      |Required|Optional|Optional|Optional
|lowest   |Required|Optional|Optional|Optional

Other optional parameteres
```ruby
message priority device title url url_title sound expire retry callback
```

#### Example Payloads
```json
{"message": "Hello World!"}
```

```json
{"title": "Hello World!", "message": "I am a notification"}
```

```json
{"message": "With Creds","token": "easy as abc 123"}
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
