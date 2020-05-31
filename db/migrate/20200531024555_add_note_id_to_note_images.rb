class AddNoteIdToNoteImages < ActiveRecord::Migration[6.0]
  def change
    add_reference :note_images, :note, null: true, foreign_key: true
  end
end
