PeepShot
===========

Provides rails helpers for interfacing with [PeepShot](http://peepshot.com).

Examples
--------

PeepShot can be integrated into your Rails application in two ways:

### Use the PeepShot image tag helper: peepshot_image_tag(url, options)

The minimum requirements for the peepshot_image_tag is an url and a width. When no height is given, PeepShot will return an un-cropped screenshot of the full page. The following example will return an 320px wide image with a height above 1000px.

    <%= peepshot_image_tag("http://ui-patterns.com", :width => 450) %>

Will return something like this:

    <img alt="Ui-patterns" src="http://api.peepshot.com/v1/0d03a6bc89/d06c16f085ceba605b5294126517d03a/450?url=http://ui-patterns.com" width="450" />

The maximum width of a screenshot is 1024 pixels.

Adding a height to the options hash will make PeepShot crop the screenshot with basis in the top left corner.

    <%= peepshot_image_tag("http://ui-patterns.com", :width => 450, :height => 337) %>

Will return something like this:

    <img alt="Ui-patterns" height="337" src="http://api.peepshot.com/v1/0d03a6bc89/d06c16f085ceba605b5294126517d03a/450x337?url=http://ui-patterns.com" width="450" />

You can add any HTML options you'd like as you would with a regular image_tag in rails:

    <%= peepshot_image_tag("http://ui-patterns.com", :width => 450, :height => 337, :class => 'thumbnail', :alt => "Go to UI-Patterns.com") %>

### Use the PeepShot url helper: peepshot_url(url, options)

If you'd like to use peepshot in your own homebrewn way, you can skip the image tag, and just get the URL for the thumbnail:

    peepshot_url("http://ui-patterns.com", :width => 320)

Installation
------------

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