class AddDescriptionToActiveStorageBlob < ActiveRecord::Migration[5.2]
  def change
    add_column :active_storage_blobs, :description, :string
  end
end
