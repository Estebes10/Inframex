class ChangeStatusDefaultInTables < ActiveRecord::Migration[5.2]
  def change
    change_column_default :blogs, :status, false
  end
end
