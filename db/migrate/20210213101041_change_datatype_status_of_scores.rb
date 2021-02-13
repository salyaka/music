class ChangeDatatypeStatusOfScores < ActiveRecord::Migration[6.0]
  def change
    change_column :scores, :status, "integer USING CAST(status AS integer)"
  end
end
