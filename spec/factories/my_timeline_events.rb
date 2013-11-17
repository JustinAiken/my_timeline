FactoryGirl.define do
  factory :my_timeline_event, :class => MyTimeline::Event do
    happened_on {Time.now - 1.year}
    description "Foo"
    original_id "1"
  end
end
