class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.references :project,    foreign_key: true,                 null:false
      t.string     :name,               limit: 256,                       null: false
      t.decimal    :quantity,                                             null: false
      t.boolean    :iva,               default: false,                    null: false
      t.decimal    :total,             :precision => 15,  :scale => 4,    null: false
      t.string     :payment_method,    limit: 256,                        null: false
      t.string     :person,            limit: 256,                        null: true
      t.date       :date,                                                 null: false
    end
  end
end
