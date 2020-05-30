class CreateNoteAndTags < ActiveRecord::Migration[6.0]
  def change
    create_table :note_and_tags do |t|
      t.references :note, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
