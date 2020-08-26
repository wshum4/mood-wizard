class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :moods
  has_many :actions, through: :user_actions
  # validates :availability, acceptance: { accept: ["Morning", "Afternoon", "Evening"] }
  validate :availability_format

  def last_mood
    User.moods.last
  end

  def availability_format
    accepted = ["Morning", "Afternoon", "Evening"]
    passes = true
    # conditiion 1
    passes = false if self.availability.empty?
    # condition 2
    self.availability.each do |i|
      unless accepted.include?(i)
        passes = false
      end
    end
    passes
  end
end
