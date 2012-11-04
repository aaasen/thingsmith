class AddMaterialToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :material, :integer
  end
end
