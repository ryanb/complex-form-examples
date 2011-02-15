class Project < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  
  validates_presence_of :name
  validates_associated :tasks, :on => :update # create automatically handles validation
  
  after_update :save_tasks

  def new_task_attributes=(task_attributes)
    task_attributes.each do |attributes|
      tasks.build(attributes)
    end
  end
  
  def existing_task_attributes=(task_attributes)
    tasks.reject(&:new_record?).each do |task|
      attributes = task_attributes[task.id.to_s]
      if attributes
        task.attributes = attributes
      else
        tasks.delete(task)
      end
    end
  end
  
  def save_tasks
    if tasks.loaded?
      tasks.each do |task|
        task.save(false)
      end
    end
  end
end
