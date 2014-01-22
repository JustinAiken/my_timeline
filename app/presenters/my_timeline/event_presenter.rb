module MyTimeline
  class EventPresenter

    attr_accessor :event

    def initialize(event)
      @event = event
    end

    def icon_path
      "my_timeline/icons/#{event.icon_name}"
    end

    def happened_on
      time.strftime MyTimeline.time_formatter
    end

    def id
      event.id
    end

  private

    def time
      return event.happened_on if event.linkable.class.respond_to? :keep_original_time_zone?
      return event.happened_on unless user.time_zone.present?

      event.happened_on.in_time_zone user.time_zone
    end

    def user
      if MyTimeline.user_class == MyTimeline::UserStub
        MyTimeline::UserStub
      else
        event.user
      end
    end

    def method_missing(meth, *args, &blk)
      if event.respond_to?(meth)
        event.send meth, *args
      else
        super
      end
    end
  end
end
