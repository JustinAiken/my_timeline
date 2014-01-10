module MyTimeline
  class Event < ActiveRecord::Base

    unless rails4?
      attr_accessible :description, :happened_on, :icon_name, :external_link, :original_id, :public, :importance
      attr_accessible :user, :linkable, :user_id, :linkable_type, :linkable_id
    end

    belongs_to :linkable, polymorphic: true, dependent: :delete
    belongs_to :user, class_name: MyTimeline.user_class.to_s

    validates :description, presence: true
    validates :happened_on, presence: true
    validates :importance, inclusion: {in: 1..10, allow_blank: true, message: "%{value} is not between 1-10." }

    scope :desc, order("my_timeline_events.happened_on DESC")
  end
end
