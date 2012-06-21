class Person < ActiveRecord::Base
  attr_accessible :email, :name, :website
  
  validates :email, :name, :presence => true
end
