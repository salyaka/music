class Score < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy
  validates :title, presence: true, length: { in: 1..50 }
  validates :point, allow_blank: true, length: { maximum: 100 }
  validate :completion_date_before
  mount_uploader :icon, ImageUploader

  enum status: {
    default: 0,
    finished: 1,
    practice: 2,
    playing: 3,
  }

  def feed_log(score_id)
    Log.where("score_id = ?", score_id)
  end

  def completion_date_before
    if start_date.present? && completion_date < start_date
      errors.add(:completion_date, "は開始日以前の日付で登録することはできません。")
    end
  end

end
