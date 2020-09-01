class Action < ApplicationRecord
  has_many :ratings
  geocoded_by :address

  validates :action_type, acceptance: { accept: ['Activity', 'Medium'] }
  validates :name, :duration, :action_type, :start_time, :end_time, presence: true
  validate :activity_validate

  def mood_available?(user)
    current_mood = user.last_mood
    dim1 = current_mood.sad_happy >= self.sad_happy[0] && current_mood.sad_happy <= self.sad_happy[1]
    dim2 = current_mood.angry_calm >= self.angry_calm[0] && current_mood.angry_calm <= self.angry_calm[1]
    dim3 = current_mood.lowenergy_highenergy >= self.lowenergy_highenergy[0] && current_mood.lowenergy_highenergy <= self.lowenergy_highenergy[1]
    dim4 = current_mood.anxious_social >= self.anxious_social[0] && current_mood.anxious_social <= self.anxious_social[1]
    return dim1 && dim2 && dim3 && dim4
  end

  def time_available?(user_start_time, user_end_time)
    user_start_datetime = user_start_time.change(year: 2000, month: 1, day: 1)
    user_end_datetime =  user_end_time.change(year: 2000, month: 1, day: 1)
    user_end_datetime += 1.day if user_end_datetime < user_start_datetime
    
    # user_start_seconds = user_start_time.utc.seconds_since_midnight
    # user_end_seconds = user_end_time.utc.seconds_since_midnight
    # user_end_seconds += 86400 if user_end_seconds < user_start_seconds
    
    user_start_datetime <= end_datetime && user_end_datetime >= start_datetime
  end

  def currently_available?
    now = Time.now.change(year: 2000, month: 1, day: 1)
    now < end_datetime && now >= start_datetime
  end

  private

  def start_datetime
    self.start_time
  end

  def end_datetime
    if start_time > end_time
      self.end_time + 1.day
    else
      self.end_time
    end
  end

  def activity_validate
    if action_type == "Activity"
      if address.present?
        geocode
      else
        errors.add(:address, "must be present")
      end
    end
  end
end
