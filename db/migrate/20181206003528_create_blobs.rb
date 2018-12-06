class CreateBlobs < ActiveRecord::Migration[5.2]
  def change
    create_table :blobs do |t|
      t.string  :name,        limit: 256,  null: false
      t.string  :description, limit: 1024, null: false
      t.boolean :status,                   null: false, default: true
      t.date    :blob_date,                null: false

      t.timestamps
    end
  end
end
