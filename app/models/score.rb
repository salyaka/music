class Score < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 1..50 }
end
