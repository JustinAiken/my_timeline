require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

begin
  require "active_resource/railtie"
rescue LoadError
end

Bundler.require(*Rails.groups)
require "my_timeline"

module Dummy
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true unless rails4?
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end

