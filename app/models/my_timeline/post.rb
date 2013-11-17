module MyTimeline
  class Post < ActiveRecord::Base
    attr_accessible :happened_on, :full_text
    attr_accessible :event, :event_id, :event_attributes

    belongs_to :event, dependent: :destroy

    validates :happened_on, presence: true
    validates :full_text, presence: true

    accepts_nested_attributes_for :event
  end
end
