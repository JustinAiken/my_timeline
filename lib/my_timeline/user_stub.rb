require 'singleton'

module MyTimeline
  class UserStub
    include Singleton

    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    def events
      Event
    end

    def settings(var = :core)
      RailsSettings::SettingObject.find_by_var var
    end

    def id
      nil
    end

    def save!
      true
    end

    def persisted?
      false
    end

    def self.method_missing(meth, *args, &blk)
      if meth.to_s =~ /^find_by/
        UserStub
      else
        instance.send meth, *args, &blk
        # super
      end
    end

    def self.settings_attr_accessor(*args)
      args.each do |method_name|
        eval "
          def self.#{method_name.to_s}
            RailsSettings::SettingObject.find_by_var(:core).send('#{method_name}')
          end
          def self.#{method_name.to_s}=(value)
            RailsSettings::SettingObject.find_by_var(:core).send('#{method_name}=', value)
          end
        "
      end
    end

    settings_attr_accessor :time_zone
  end
end
