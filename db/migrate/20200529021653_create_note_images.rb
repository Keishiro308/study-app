class CreateNoteImages < ActiveRecord::Migration[6.0]
  def change
    create_table :note_images do |t|

      t.timestamps
    end
  end
end
