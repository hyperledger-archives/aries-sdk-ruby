# rindy

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A ruby wrapper for [indy-sdk](https://github.com/hyperledger/indy-sdk).

## Installation

Create a new rails application:

    $ rails new rindy-rails --skip-active-record
    $ cd rindy-rails
    $ 

Then, add this line to your application's Gemfile:

```ruby
gem 'rindy', :github => "johncallahan/rindy"
```

You *must* have rust installed.  Then, execute:

    $ bundle

WARNING: You may have to wait a bit for the native extension to build the rindy gem.

## Usage

To try out the gem, execute:

    $ bundle exec rails c
    > wallet = IndyWallet.new("mywallet")
    > wallet.create
    > pool = IndyPool.new("mypool")
    > pool.create
    > 

If you check ~/.indy_client/pool and ~/.indy_client/wallet directories, you should see the pool and wallet you created.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).  (This gem not yet available on rubygems)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johncallahan/rindy.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT) and the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).
