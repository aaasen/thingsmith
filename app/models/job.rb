class Job < ActiveRecord::Base
	attr_accessible :name, :dimension_x, :dimension_y, :thickness, :material, :completion_date, :budget, :file_url

	MATERIALS = { '1/8in Plywood' => 1, '1/4in Plywood' => 2 }

	belongs_to :user

	has_many :bids, :dependent => :destroy

	validates :name, :presence => true,
		:length => { :minimum => 6, :maximum => 30 }
	validates :dimension_x, :presence => true
	validates :dimension_y, :presence => true
	validates :budget, :presence => true
end
