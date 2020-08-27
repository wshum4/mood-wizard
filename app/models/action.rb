class Action < ApplicationRecord
  has_many :ratings

  validates :action_type, acceptance: { accept: ['Activity', 'Medium'] }
  validates :name, :duration, :action_type, :time_of_day, :start_time, presence: true

  def mood_available?(user)
    current_mood = user.last_mood
    dim1 = current_mood.sad_happy >= self.sad_happy[0] && current_mood.sad_happy <= self.sad_happy[1]
    dim2 = current_mood.angry_calm >= self.angry_calm[0] && current_mood.angry_calm <= self.angry_calm[1]
    dim3 = current_mood.lowenergy_highenergy >= self.lowenergy_highenergy[0] && current_mood.lowenergy_highenergy <= self.lowenergy_highenergy[1]
    dim4 = current_mood.anxious_social >= self.anxious_social[0] && current_mood.anxious_social <= self.anxious_social[1]
    return dim1 && dim2 && dim3 && dim4
  end

  def time_available?(user_start_time, user_end_time)
    start_of_day = Time.now.utc.beginning_of_day
    user_start_seconds = user_start_time.utc.seconds_since_midnight
    user_end_seconds = user_end_time.utc.seconds_since_midnight
    user_end_seconds += 86400 if user_end_seconds < user_start_seconds
  
    user_start_seconds > start_seconds && user_end_seconds < end_seconds
  end

  def currently_available?
    now = Time.now.utc.seconds_since_midnight
    now < end_seconds
  end

  private

  def start_seconds
    self.start_time.seconds_since_midnight
  end

  def end_seconds
    if start_time > end_time
      (self.end_time.seconds_since_midnight + 1.day.seconds).to_f
    else
      self.end_time.seconds_since_midnight
    end
  end
end
