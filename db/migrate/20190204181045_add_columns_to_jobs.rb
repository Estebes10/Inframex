class AddColumnsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :weight, :decimal, null: false
    add_column :jobs, :unity, :string, null: false
  end
end
