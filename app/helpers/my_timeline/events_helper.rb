module MyTimeline
  module EventsHelper
    def date_header_string(date)
      date.strftime "%b #{date.day.ordinalize}, %Y"
    end
  end
end
