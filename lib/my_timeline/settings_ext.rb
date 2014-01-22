require 'rails-settings'

module MyTimeline
  module SettingsExt
    def self.extend_rails_settings

      RailsSettings::SettingObject.class_eval do
        self.table_name = "my_timeline_settings"

        MyTimeline.config_object = ::RailsSettings::Configuration.new(MyTimeline.user_class) do |s|
          s.key :core
        end

        MyTimeline.user_class.class_eval do
          self.send :include, ::RailsSettings::Base
          self.send :extend,  ::RailsSettings::Scopes

          def self.settings_attr_accessor(*args)
            args.each do |method_name|
              eval "
                def #{method_name}
                  self.settings(:core).send(:#{method_name})
                end
                def #{method_name}=(value)
                  self.settings(:core).send(:#{method_name}=, value)
                end
              "
            end
          end

          settings_attr_accessor :time_zone

        end unless MyTimeline.user_class == MyTimeline::UserStub
      end
    end
  end
end

