class ChangeReferenceToBlogsInsteadOfProjectsInExpenses < ActiveRecord::Migration[5.2]
  def change
    remove_column :expenses, :project_id
    add_reference :expenses, :blog, foreign_key: true, null: false
  end
end
