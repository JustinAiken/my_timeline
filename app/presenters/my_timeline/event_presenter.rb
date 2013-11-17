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
      event.happened_on.strftime("%-l:%M %P")
    end

    def id
      event.id
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
