class ModifyExpensesAndAddSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name, limit: 256, null: false
    end

    remove_column :expenses, :category_id
    add_reference :expenses, :supplier, foreign_key: true, null: false
    remove_column :expenses, :status
    add_column    :expenses, :status, :boolean, default: false, null: false
    add_column    :expenses, :status_ticket, :boolean, default: false, null: false
  end
end
