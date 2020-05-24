class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :questions, :question, true
    change_column_null :questions, :answer, true
  end

  def down
    change_column_null :questions, :question, false
    change_column_null :questions, :answer, false
  end
end
