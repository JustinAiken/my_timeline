require 'rails-settings'

module MyTimeline
  module SettingsExt
    def extend_rails_settings

      RailsSettings::SettingObject.class_eval do
        self.table_name = "my_timeline_settings"

        MyTimeline.config_object = ::RailsSettings::Configuration.new(MyTimeline.user_class) do |s|
          s.key :empty_placeholder
        end

        MyTimeline.user_class.class_eval do
          self.send :include, ::RailsSettings::Base
          self.send :extend,  ::RailsSettings::Scopes

          MyTimeline.config_object.key :twitter, defaults: {foo: "bar"}
          MyTimeline.config_object.key :github, defaults: {foo: "bar"}
        end unless MyTimeline.user_class == MyTimeline::UserStub
      end
    end
  end
end
