PeepShot
===========

Provides rails helpers for interfacing with [PeepShot](http://peepshot.com).

Example
-------

Prerequisite: You need a peepshot.com account. Have your API Key and API Secret handy.

### 1. Install peepshot as a gem in your rails app.

Add this to your Gemfile: (change version numbers if needed)

    gem 'peepshot', '0.2.0'

Don’t forget to run “bundle install” command every time you change something in the Gemfile.

### 2. Create `config/peepshot.yml` with the appropriate environment.

    production:
      api_key: <your API key>
      api_secret: <your API secret>

### 3. Create `config/initializers/peepshot.rb` and place the following line in it

    PeepShot.load_peepshot_yaml

Contributing
------------

Unit tests use rspec and require the following environment configuration to run:
    rails 2.3.10
    rspec 1.3.1
    rspec-rails 1.3.3
    json 1.4.0

Invoke tests on Mac/Linux by running `rake spec` from this directory

Invoke tests on Windows by running `spec spec/` from this directory

Copyright (c) 2012 Anders Toxboe, released under the MIT license