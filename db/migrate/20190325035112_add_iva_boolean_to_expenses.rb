class AddIvaBooleanToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :iva, :boolean, null: false, default: false
  end
end
