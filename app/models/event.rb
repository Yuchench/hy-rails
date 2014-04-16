class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :event_date, presence: true
end
