# rindy

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A ruby wrapper for [indy-sdk](https://github.com/hyperledger/indy-sdk).

## Installation

Clone this project.  You must have rust tools installed first.  Then, build and install the gem:

    $ git clone https://github.com/johncallahan/rindy.git
    $ cd rindy
    $ rake build
    $ gem build rindy.gemspec
    $ gem install rindy-0.0.X.gem
    $

Add this line to your application's Gemfile:

```ruby
gem 'rindy'
```

And then execute:

    $ bundle

## Usage

Currently, only IndyWallet and IndyPool classes are implemented using helix.  Check your ~/.indy-client directory for existing wallet and pool files, then you can run the ruby tests:

    $ rspec

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).  (This gem not yet available on rubygems)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johncallahan/rindy.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT) and the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).
