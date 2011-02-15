class Task < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :name
end
