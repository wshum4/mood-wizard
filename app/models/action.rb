class Action < ApplicationRecord
  has_many :ratings

  validates :type, acceptance: { accept: ['Activity', 'Medium'] }
  validates :name, :duration, :type, :time_of_day, :start_time, presence: true
end
