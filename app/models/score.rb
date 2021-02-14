class Score < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 1..50 }
  mount_uploader :icon, ImageUploader

  enum status: {
    default: 0,
    finished: 1,
    practice: 2,
    playing: 3,
  }
end
