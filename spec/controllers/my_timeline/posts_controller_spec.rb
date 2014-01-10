require 'spec_helper'

describe MyTimeline::PostsController do
  routes { MyTimeline::Engine.routes }

  before { ApplicationController.any_instance.stub :current_user }

  describe "GET #new" do
    it "news" do
      get "new"
      subject.instance_variable_get(:@post).should  be_a MyTimeline::Post
      subject.instance_variable_get(:@event).should be_a MyTimeline::Event
    end
  end

  describe "POST #create" do
    it "creates the event/post" do
      post "create", post: {happened_on: Time.now, full_text: "foo", event_attributes: {description: "bar", public: "true"}}
      MyTimeline::Post.last.should_not be_nil
      response.should redirect_to root_path
    end
  end
end
