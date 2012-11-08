class Email < ActiveRecord::Base
  attr_accessible :email

  validates :email, :presence => true,
   :uniqueness => true,
   :email => true
end
