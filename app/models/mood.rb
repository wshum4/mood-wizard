class Mood < ApplicationRecord
  belongs_to :user
  belongs_to :user_action, optional: true

  validates :sad_happy, :angry_calm, :lowenergy_highenergy, :anxious_social, presence: true

  def time_since
    # Returns the number of seconds since the mood was created
    Time.now - created_at
  end
end
