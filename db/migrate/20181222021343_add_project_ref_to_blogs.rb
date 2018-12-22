class AddProjectRefToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :project, foreign_key: true
  end
end
