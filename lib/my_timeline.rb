require 'kaminari'

require "my_timeline/user_stub"
require "my_timeline/engine"

module MyTimeline

  mattr_accessor :user_class, :user_slug, :render_method, :table_class, :config_object, :enabled_plugins

  @@user_class = 'MyTimeline::UserStub'
  def self.user_class
    @@user_class.constantize
  end

  @@user_slug = :id

  @@render_method = 'table'
  @@use_bootstrap = true

  @@table_class = "table table-striped"

  @@enabled_plugins = []
  def self.register_plugin(plugin_name, options = {})
    MyTimeline.config_object.key plugin_name, options
    @@enabled_plugins << plugin_name
  end

  def self.setup
    yield self
  end
end
