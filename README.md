# 🔑 RandomPassword

[![Gem Version](https://badge.fury.io/rb/random_password.svg)](https://badge.fury.io/rb/random_password)

🔑 RandomPassword is a strong password generator that help your way to generate secure password quickly.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'random_password'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install random_password

## Usage

Creating a RandomPassword::Base instance to generate strong passwords.

```ruby
# create a RandomPassword::Base instance
random_password = RandomPassword.new(length: 24, digits: 7, symbols: 4)
=> #<RandomPassword::Base:0x00007facdd82f5c8 @length=24, @digits=7, @symbols=4>

# generate a strong password along to the given options
random_password.generate
=> "F3F[@85jAeeezcM368f@6cs;"

# update options
random_password.update(length: 12, digits: 4, symbols: 3)
=> #<RandomPassword::Base:0x00007facde2466d8 @length=12, @digits=4, @symbols=3>
random_password.generate
=> "tN?h246#2)kB"
```

Creating a strong password.

```ruby
RandomPassword.generate(length: 24, digits: 7, symbols: 4)
=> "V0+Dl*J.IE2PG1Vyh12,8kP6"
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/akinrt/random_password. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RandomPassword project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/akinrt/random_password/blob/master/CODE_OF_CONDUCT.md).
