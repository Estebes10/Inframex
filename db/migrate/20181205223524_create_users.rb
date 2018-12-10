class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   "name"
      t.string   "lastName"
      t.string   "password"
      t.date     "birthday"
      t.string   "email"
      t.string   "phone"
      t.boolean  "status",          default: true
      t.string   "password_digest"
      t.string   "remember_digest"
      t.timestamps
    end
  end
end
