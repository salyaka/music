class Log < ApplicationRecord
  belongs_to :score
  validates :content, presence: true
end
