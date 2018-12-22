class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name, limit: 256, null: false
      t.timestamps
    end
  end
end
