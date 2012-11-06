class Bid < ActiveRecord::Base
	attr_accessible :user_id, :job_id, :amount, :notes, :days, :accepted

	belongs_to :job

	validates :amount, :presence => true
	validates :notes, :allow_blank => true,
		:length => { :maximum => 140 }
	validates :days, :numericality => { :only_integer => true }
end
