class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :name
      t.float :dimension_x
      t.float :dimension_y
      t.float :thickness
      t.references :material
      t.date :completion_date
      t.float :budget
      t.string :file_url
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
