require 'spec_helper'

module MyTimeline
  describe Event do
    it "is an event" do
      e = Event.new
      e.save.should be_false

      f = Event.new(
        happened_on: Time.now,
        description: "foo",
        original_id: "6"
      )
      f.save.should be_true

      e = FactoryGirl.create(:my_timeline_event)
      e.save.should be_true
    end
  end
end
