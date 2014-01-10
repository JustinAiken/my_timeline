require 'spec_helper'

describe MyTimeline::ApplicationController do
  describe "#find_user" do

    before { subject.params = {user_id: "7"} }
    after do
      subject.params.should == {}
    end

    context "when the user exists" do
      it "sets some variables" do
        MyTimeline::UserStub.should_receive(:find_by_id).with("7").and_return "foo"
        subject.stub(:current_user).and_return "foo"
        subject.send :find_user
        subject.instance_variable_get(:@owner_viewing).should be_true
        subject.instance_variable_get(:@show_hidden).should   be_true
      end
    end

    context "when the user is not found" do
      it "doesn't do much" do
        subject.stub(:current_user).and_return nil
        subject.send :find_user
        subject.instance_variable_get(:@owner_viewing).should be_false
        subject.instance_variable_get(:@show_hidden).should   be_false
      end
    end
  end
end
