class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :title, null: false, comment: "曲名"
      t.integer :grade, comment: "楽譜の等級"
      t.date :start_date, comment: "開始日"
      t.date :completion_date, comment: "完成日"
      t.string :icon
      t.string :status
      t.text :point

      t.timestamps
    end
  end
end
