class ChangeDatatypeGradeOfScores < ActiveRecord::Migration[6.0]
  def change
    change_column :scores, :grade, :string
  end
end
