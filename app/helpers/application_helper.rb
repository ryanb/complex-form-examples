# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def add_task_link(name, f)
    fields = new_child_fields(f, :tasks)
    link_to_function(name, "insert_fields('tasks', '#{escape_javascript(fields)}')")
  end
  
  def new_child_fields(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    form_builder.fields_for(method, options[:object], :child_index => 'NEW_RECORD') do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end
end
