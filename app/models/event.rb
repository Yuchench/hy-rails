class Event < ActiveRecord::Base
  scope :afterToday, where("event_date >= ?", Date.today).order('event_date')
  validates :url, :format => URI::regexp(%w(http https))
  validates :name, presence: true
  validates :event_date, presence: true
end
