class CreateStudyLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :study_logs do |t|
      t.references :question, null: false, foreign_key: true
      t.integer :correctness, null: false

      t.timestamps
    end
  end
end
