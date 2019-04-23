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
gem 'rindy'
```

You *must* have rust installed *and* set LIBRARY_PATH:

    $ export LIBRARY_PATH=/your/path/to/indy-sdk/libindy/target/debug/

See [these instructions](https://github.com/hyperledger/indy-sdk#installing-the-sdk) to install or build the Indy SDK.  Then, execute:

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

First, you *must* have rust installed *and* set LIBRARY_PATH:

    $ export LIBRARY_PATH=/your/path/to/indy-sdk/libindy/target/debug/

See [these instructions](https://github.com/hyperledger/indy-sdk#installing-the-sdk) to install or build the Indy SDK.  Then, clone the repo and execute:

    $ rake
    $ rspec
    $

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johncallahan/rindy.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT) and the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).
