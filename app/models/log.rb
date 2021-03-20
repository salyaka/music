class Log < ApplicationRecord
  belongs_to :score
  validates :content, presence: true, length: { maximum: 200 }
  validates :start_time, presence: true
  validate :start_time_future

  def start_time_future
    if start_time.present? && start_time > Date.today
      errors.add(:start_time, "未来の日付は登録できません" ) 
    end
  end

end