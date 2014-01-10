module MyTimeline
  class EventsController < MyTimeline::ApplicationController

    def index
      if @show_hidden
        q = {}
      else
        q = {public: true}
      end

      @events = @user.events.where(q).desc.page params[:page]

      @events_by_day     = @events.all.to_a.group_by { |e| e.happened_on.to_date }
      @dates_with_events = build_dates
    end

    def show
      #
    end

    def edit
      @event = Event.find_by_id(params[:id])
    end

    def update
      @event = Event.find_by_id(params[:id])
      if @event.update_attributes(rails4? ? event_params : params[:event])
        redirect_to root_path, notice: "Edit successful."
      else
        render 'edit'
      end
    end

    def destroy
      @event = Event.find_by_id(params[:id])
      @event.destroy

      redirect_to root_path
    end

  private

    DateWithEvents = Struct.new(:date, :events)

    def build_dates
      [].tap do |array|
        @events_by_day.each do |date, events|
          array << DateWithEvents.new(date, events.reverse)
        end
      end
    end

    if rails4?
      define_method :event_params do
        params.required(:event).permit :description, :happened_on, :public
      end
    end
  end
end
