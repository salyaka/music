class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :score, null: false, foreign_key: true
      t.text :content
      t.date :start_time

      t.timestamps
    end
  end
end
