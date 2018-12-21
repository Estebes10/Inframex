class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name, limit: 256, null: false
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
