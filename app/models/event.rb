class Event < ActiveRecord::Base
  validates :url, :format => URI::regexp(%w(http https))
  validates :name, presence: true
  validates :event_date, presence: true
end
