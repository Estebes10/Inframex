class AddColumnsToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :weight, :decimal
    add_column :jobs, :unity, :string
  end
  
  def change
    remove_reference :jobs, :blog, index: true, foreign_key: true
  end
end
