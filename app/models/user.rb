class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :moods, dependent: :destroy
  has_many :user_actions, dependent: :destroy
  has_many :actions, through: :user_actions

  def last_mood
    moods.last
  end

  def second_last_mood
    moods.second_to_last
  end

  def moods_before_activity
    Mood.where(user: self, user_action: nil)
  end
end
