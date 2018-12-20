class CreatePrivileges < ActiveRecord::Migration[5.2]
  def change
    create_table :privileges do |t|
      t.string :name, limit: 256, null: false
      t.text :description, limit: 1024
      t.string :module, limit: 256, null: false
      t.string :str_id, limit: 256, null: false
      t.timestamps
    end
  end
end
