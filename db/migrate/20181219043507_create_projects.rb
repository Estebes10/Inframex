class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string  :name,    limit: 256, null: false
      t.string  :code,    limit: 32
      t.string  :address, limit: 256
      t.date    :start_date
      t.date    :due_date
      t.string  :client,  limit: 256
      t.boolean :status, null: false, default: true
      t.timestamps
    end
  end
end
