class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   "name",     limit: 128, null: false
      t.string   "lastName", limit: 128, null: false
      t.string   "password", limit: 64
      t.date     "birthday"
      t.string   "email",    limit: 128, null: false
      t.string   "phone",    limit: 20
      t.boolean  "status",          default: true
      t.string   "password_digest"
      t.string   "remember_digest"
      t.timestamps
    end
  end
end
