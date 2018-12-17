class AddConmmentsToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :comments, :string
    rename_column :blogs, :blog_date, :date
  end
end
