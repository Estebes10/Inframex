class ChangeRoleAndPrivelegeReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :roleprivileges, :role, foreign_key: true
    add_reference :roleprivileges, :privilege, foreign_key: true
  end
end
