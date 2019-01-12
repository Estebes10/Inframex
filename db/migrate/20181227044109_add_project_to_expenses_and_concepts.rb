class AddProjectToExpensesAndConcepts < ActiveRecord::Migration[5.2]
  def change
    add_reference :expenses, :project, foreign_key: true
    add_reference :concepts, :project, foreign_key: true
  end
end
