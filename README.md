config_file
============

Simple library for reading configuration from different sources.

## Installation

Add this line to your application's Gemfile:

    gem 'config_file'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install config_file

## Usage

```ruby
require 'config_file'

configurator = ConfigFile.bew

config1 = configurator.load "spec/config/test_config.yaml"
config2 = configurator.load "spec/config/test_config.json"
config3 = configurator.load "spec/config/test_config.rb"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

