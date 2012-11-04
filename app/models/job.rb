class Job < ActiveRecord::Base
  attr_accessible :name, :dimension_x, :dimension_y, :thickness, :material, :completion_date, :budget, :file_url

  MATERIALS = { 'plywood' => 1 }
end
