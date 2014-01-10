require 'spec_helper'

describe MyTimeline::EventsController do
  routes { MyTimeline::Engine.routes }

  before { ApplicationController.any_instance.stub :current_user }

  describe "GET #index" do
    it "gets okay" do
      get "index"
      response.code.should == "200"
    end
  end

  describe "GET #show" do
    xit "shows stuff" do
    end
  end

  describe "GET #edit" do
    xit "edits" do
      get "edit"
    end
  end

  describe "#update" do
    xit "updates" do
    end
  end

  describe "#destroy" do
    xit "kills it"
  end
end
