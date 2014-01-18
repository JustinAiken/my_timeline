module MyTimeline
  class UserStub

    def self.events
      Event
    end

    def self.settings
      RailsSettings::SettingObject
    end

    def self.id
      nil
    end

    def self.save!
      true
    end

    def self.method_missing(meth, *args, &blk)
      if meth.to_s =~ /^find_by/
        UserStub
      else
        super
      end
    end

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
  end
end
