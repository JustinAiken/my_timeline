module MyTimeline
  class ControlPanelController < MyTimeline::ApplicationController

    def index
      @enabled_plugins = MyTimeline.enabled_plugins
    end

    def timezone
      if rails4?
        @user.time_zone = user_params[:time_zone]
      else
        @user.time_zone = params[:user][:time_zone]
      end

      @user.save!
      redirect_to :back, notice: "Time zone setting saved."
    end

  private

    if rails4?
      define_method :user_params do
        params.required(:user).permit :time_zone
      end
    end
  end
end
