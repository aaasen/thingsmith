class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  has_many :jobs

  attr_accessible :city, :bio

  validates :bio, :allow_blank => true,
    :length => { :maximum => 140 }
  validates :city, :allow_blank => true,
    :length => { :minimum => 3, :maximum => 30 }

  acts_as_dailycred
end
