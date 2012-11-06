class Job < ActiveRecord::Base
	attr_accessible :name, :dimension_x, :dimension_y, :thickness, :material, :completion_date, :budget, :file_url, :complete

	MATERIALS = { '1/8in Plywood' => 1, '1/4in Plywood' => 2, 'Premium Human Poop' => 3 }

	belongs_to :user

	has_many :bids, :dependent => :destroy

	validates :name, :presence => true,
		:length => { :minimum => 6, :maximum => 30 }
	validates :dimension_x, :presence => true
	validates :dimension_y, :presence => true
	validates :budget, :presence => true

	def owns_job(user)
		return (self.user and self.user == user)
	end
end
