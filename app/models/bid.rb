class Bid < ActiveRecord::Base
	attr_accessible :user_id, :job_id, :amount, :notes, :days

	belongs_to :job

	validates :amount, :presence => true
	validates :notes, :allow_blank => true,
		:length => { :minimum => 6, :maximum => 60 }
	validates :days, :numericality => { :only_integer => true }
end
