class Assignment < ActiveRecord::Base
  belongs_to :task
  has_many :steps, :dependent => :destroy
  validates_presence_of :owner
  accepts_nested_attributes_for :steps, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
end
