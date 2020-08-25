class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :action

  validates :rating, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
