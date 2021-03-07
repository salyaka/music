class Log < ApplicationRecord
  belongs_to :score
  validates :content, presence: true
  validates :start_time, presence: true
end