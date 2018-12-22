class ChangeQuantityTypeAndAddConceptsToExpenses < ActiveRecord::Migration[5.2]
  def change
    change_column :expenses, :quantity, :decimal
    change_column :concepts, :quantity, :decimal
    add_reference :expenses, :concept, foreign_key: true, null: false
  end
end
