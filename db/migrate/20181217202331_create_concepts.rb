class CreateConcepts < ActiveRecord::Migration[5.2]
  def change
    create_table :concepts do |t|
      t.references :category,    foreign_key: true,                 null: false
      t.string     :code,         limit: 6,                         null: false
      t.string     :description,  limit: 1024,                      null: false
      t.integer    :quantity,                                       null: false
      t.string     :unity,                                          null: false
      t.decimal    :unit_price,  :precision => 15,  :scale => 4,    null: false
      t.decimal    :total,       :precision => 15,  :scale => 4,    null: false
    end
  end
end
