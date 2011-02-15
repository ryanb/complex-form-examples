module ProjectsHelper
  def add_task_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :tasks, :partial => 'task', :object => Task.new
    end
  end
  
  def fields_for_task(task, &block)
    new_or_existing = task.new_record? ? 'new' : 'existing'
    prefix = "project[#{new_or_existing}_task_attributes][]"
    fields_for(prefix, task, &block)
  end
end
