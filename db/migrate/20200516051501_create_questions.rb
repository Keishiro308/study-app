class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :question, null:false
      t.text :answer, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :use, null: false , default: true

      t.timestamps
    end
  end
end
