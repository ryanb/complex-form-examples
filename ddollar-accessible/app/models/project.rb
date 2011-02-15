class Project < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy, :accessible => true
  
  validates_presence_of :name
  validates_associated :tasks, :on => :update # automatically validated on create
end
