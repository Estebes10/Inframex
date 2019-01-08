class AddConceptAndQuantityToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :concept, foreign_key: true
    add_column :jobs, :quantity, :decimal
  end
end
