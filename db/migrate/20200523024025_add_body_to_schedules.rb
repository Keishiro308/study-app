class AddBodyToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :body, :string, null: false
  end
end
