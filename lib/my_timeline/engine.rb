require 'my_timeline/settings_ext'
require 'my_timeline/core_ext/rails4'

module MyTimeline
  class Engine < ::Rails::Engine

    isolate_namespace MyTimeline

    config.autoload_paths << File.expand_path("../../app/classes/**", __FILE__)
    config.autoload_paths << File.expand_path("../../app/scrapers/**", __FILE__)

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    config.after_initialize do |app|
      MyTimeline::SettingsExt.extend_rails_settings
    end

    config.to_prepare do |app|
      MyTimeline::SettingsExt.extend_rails_settings
    end if Rails.env.development?
  end
end
