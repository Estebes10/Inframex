class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :category,    foreign_key: true,                 null:false
      t.references :subcategory, foreign_key: true,                 null:false
      t.string     :name,         limit: 256,                       null: false
      t.date       :date,                                           null: false
      t.integer    :quantity,                                       null: false
      t.string     :unity,                                          null: false
      t.decimal    :unit_price,  :precision => 15,  :scale => 4,    null: false
      t.decimal    :total,       :precision => 15,  :scale => 4,    null: false
      t.boolean    :status,      default: true,                     null: false
    end
  end
end
