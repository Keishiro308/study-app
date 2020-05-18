class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.integer :priority, null: false
      t.integer :predicted_time, null: false
      t.integer :actual_time
      t.text :review
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
