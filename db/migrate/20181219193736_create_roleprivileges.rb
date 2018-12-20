class CreateRoleprivileges < ActiveRecord::Migration[5.2]
  def change
    create_table :roleprivileges do |t|
      t.timestamps
    end
  end
end
