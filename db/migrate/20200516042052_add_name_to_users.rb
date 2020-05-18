class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    #Ex:- :null => false
  end
end
