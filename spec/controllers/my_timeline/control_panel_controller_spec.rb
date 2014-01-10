require 'spec_helper'

describe MyTimeline::ControlPanelController do
  routes { MyTimeline::Engine.routes }

  before { ApplicationController.any_instance.stub :current_user }

  describe "GET #index" do
    it "gets okay" do
      get "index"
      response.code.should == "200"
    end
  end
end
