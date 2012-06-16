module TaskListsHelper

  # Renders a closed eye icon if the task list is private, or an open eye if it
  # is public.
  #
  def task_list_icon(task_list)
    html_class = task_list.public? ? 'icon-eye-open' : 'icon-eye-close'
    icon(html_class)
  end

  # A trash can
  #
  def remove_task_list_icon
    icon('icon-trash')
  end
end
