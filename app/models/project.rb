class Project < ActiveRecord::Base
  has_many :tasks
  validates_presence_of :name
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
end
