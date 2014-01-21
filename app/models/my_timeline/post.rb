module MyTimeline
  class Post < ActiveRecord::Base

    unless rails4?
      attr_accessible :happened_on, :full_text
      attr_accessible :event, :event_id, :event_attributes
    end

    belongs_to :event, dependent: :destroy

    validates :happened_on, presence: true
    validates :full_text, presence: true

    accepts_nested_attributes_for :event

    def self.is_exandable?
      true
    end
  end
end
