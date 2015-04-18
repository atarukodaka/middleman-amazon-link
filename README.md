[![Gem Version](http://img.shields.io/gem/v/middleman-amazon-link.svg?style=flat)](gem)
[![Build Status](https://travis-ci.org/atarukodaka/middleman-amazon-link.svg)](https://travis-ci.org/atarukodaka/middleman-amazon-link)
[![Coverage Status](https://coveralls.io/repos/atarukodaka/middleman-amazon-link/badge.svg)](https://coveralls.io/r/atarukodaka/middleman-amazon-link)
[![Code Climate](https://codeclimate.com/github/atarukodaka/middleman-amazon-link/badges/gpa.svg)](https://codeclimate.com/github/atarukodaka/middleman-amazon-link)


# middleman-amazon-link


**middleman-amazon-link** is a [Middleman](http://middlemanapp.com)
extension that generates links to amazon on products specified.


## Installation


1. Specify the dependency in your project's `Gemfile`:

  ```ruby
  gem "middleman-amazon-link"
  ```

2. Activate the extension in your project's `config.rb`:

  ```ruby
  # config.rb
  activate :amazon_link do |amazon|
    amazon.associate_tag = "xxxx-22"
	amazon.aws_access_key_id = "xxxx"
    amazon.aws_secret_key = "xxx"

    # optional below
    amazon.country = "jp"
    amazon.use_cache = true
    amazon.cache_dir = ".cache/amazon"
  end
  ```

## Usage

Call 'amazon(asin)' function in your page file:

  **ERB:**

  ```erb
  # Amazon Link
  <%= amazon('ASINXXXXXXX', :detail) %>
  ```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## License

Copyright (c) 2015 Ataru Kodaka. See [LICENSE](./LICENSE) for details.
