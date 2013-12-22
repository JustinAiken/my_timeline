

# My Timeline [![Code Climate](https://codeclimate.com/github/JustinAiken/my_timeline.png)](https://codeclimate.com/github/JustinAiken/my_timeline) [![Build Status](https://secure.travis-ci.org/JustinAiken/my_timeline.png?branch=master)](http://travis-ci.org/JustinAiken/my_timeline)
#### A social-media aggregation/display plugin 

This is a Rails Engine to help pull in content from any number of social media sites, services, or websites.
The aggregated information is displayed in a unified timeline.

It is being developed with extensibility in mind - each service will have it's own plugin.

### What it looks like:
![Screenshot](doc/screenshot.png)

### Requirements:
- Rails 3.x - Rails 4 is not currently supported, but it's on the todo..
- Bootstrap (or bootstrap-named classes) - For the markup.  Just stuff like `table.table-striped`, no stuctural markup from Bootstrap is needed
- Any standard ActiveRecord-compatible database should work

### Supported services:

- [Runkeeper](https://github.com/JustinAiken/my_timeline-health_graph)
- [Twitter](https://github.com/JustinAiken/my_timeline-twitter)
- [Github](https://github.com/JustinAiken/my_timeline-github)
- If you develop another, let me know and I'll add it here!

### Demonstration

There is a [small demo app](https://github.com/JustinAiken/my_timeline-demo) available to show how it looks inside a fresh Rails application with a Devise User system.

### Usage:

1. Add the gem to your Gemfile: `gem 'my_timeline'` and `bundle install`
2. Install the config file: `rails g my_timeline:install`
3. Edit `config/initializers/my_timeline.rb` to taste
4. Mount the engine in your routes:
  ```ruby
  # A timeline belongs_to User
  resources :users do
    mount MyTimeline::Engine => '/timeline', as: :my_timeline
  end
  ```

  or

  ```ruby
  # No Users, just a dedicated timeline route
    mount MyTimeline::Engine => '/timeline', as: :my_timeline
  ```
5. Add a gem for any service you'd like to add on.

## Credits

Original author: [Justin Aiken](https://github.com/JustinAiken)

## Links

* [Source](https://github.com/JustinAiken/my_timeline)
* [Bug Tracker](https://github.com/JustinAiken/my_timeline/issues)
* [Rubygem](https://rubygems.org/gems/my_timeline)

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  * If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2013 Justin Aiken Inc. MIT license (see LICENSE for details).
