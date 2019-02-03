class CreateJobProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :job_progresses do |t|
      t.decimal     :quantity,  :precision => 15,  :scale => 4, null: false
      t.boolean     :status,    null: false,    default: false
      t.references  :blog,      foreign_key: true
      t.references  :job,       foreign_key: true
      t.timestamps
    end
  end
end
