class AddWeightToConcepts < ActiveRecord::Migration[5.2]
  def change
    add_column :concepts, :weight, :decimal, null: false
  end
end
