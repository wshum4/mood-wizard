class Mood < ApplicationRecord
  belongs_to :user

  validates :happy_sad, :calm_angry, :highenergy_lowenergy, :social_anxious, presence: true

  def time_since
    # Returns the number of seconds since the mood was created
    Time.now - created_at
  end
end
