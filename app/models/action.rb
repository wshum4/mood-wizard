class Action < ApplicationRecord
  has_many :ratings

  validates :action_type, acceptance: { accept: ['Activity', 'Medium'] }
  validates :name, :duration, :action_type, :time_of_day, :start_time, presence: true

  def compare_against(user)
    current_mood = user.last_mood
    current_mood.sad_happy >= self.sad_happy[0] && current_mood.sad_happy <= self.sad_happy[1] &&
    current_mood.angry_calm >= self.angry_calm[0] && current_mood.angry_calm <= self.angry_calm[1] &&
    current_mood.lowenergy_highenergy >= self.lowenergy_highenergy[0] && current_mood.lowenergy_highenergy <= self.lowenergy_highenergy[1] &&
    current_mood.anxious_social >= self.anxious_social[0] && current_mood.anxious_social <= self.anxious_social[1]
  end
end
