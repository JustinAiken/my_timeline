require 'my_timeline/settings_ext'

module MyTimeline
  class Engine < ::Rails::Engine
    include SettingsExt

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
      extend_rails_settings
    end
  end
end
