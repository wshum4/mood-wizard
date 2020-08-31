class UserAction < ApplicationRecord
  belongs_to :user
  belongs_to :action
  has_many :moods

  # compare last mood & second last mood to display on @past_activities card
  def mood_before
    @mood_before ||= user.moods.where('created_at < ?', self.created_at).order(created_at: :desc).limit(1).first
    @mood_before
  end

  def mood_after
    @mood_after ||= user.moods.where('created_at > ?', self.created_at).order(created_at: :asc).limit(1).first
    @mood_after
  end
end
