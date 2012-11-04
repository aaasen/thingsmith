class RemoveThicknessFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :thickness
  end

  def down
    add_column :jobs, :thickness, :float
  end
end
