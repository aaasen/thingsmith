class RemoveMaterialFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :material
  end

  def down
    add_column :jobs, :material, :references
  end
end
