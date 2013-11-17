module MyTimeline
  class ControlPanelController < MyTimeline::ApplicationController

    def index
      @enabled_plugins = MyTimeline.enabled_plugins
    end
  end
end
