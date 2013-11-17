class MyTimeline::ApplicationController < ApplicationController

  before_filter :find_user

private

  def find_user
    @user = MyTimeline.user_class.send "find_by_#{MyTimeline.user_slug}", params[:user_id]

    if @user == current_user
      @owner_viewing = true
      @show_hidden   = true
    else
      #
    end

    params.delete :user_id
  end
end
