class Bid < ActiveRecord::Base
  attr_accessible :user_id, :job_id, :amount, :notes

  belongs_to :job
end
