class Mood < ApplicationRecord
  belongs_to :user

  validates :happy_sad, :calm_angry, :highenergy_lowenergy, :social_anxious, presence: true
end
