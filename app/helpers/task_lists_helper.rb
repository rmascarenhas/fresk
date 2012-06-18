module TaskListsHelper

  # Renders a lock icon if the task list is private, or an unlock icon if it
  # is public.
  #
  def task_list_icon(task_list)
    html_class = task_list.public? ? 'icon-unlock' : 'icon-lock'
    icon(html_class)
  end

  # A trash can
  #
  def remove_task_list_icon
    icon('icon-trash')
  end

  # An open eye.
  #
  def task_list_watch_icon
    icon('icon-eye-open')
  end

  # A closed eye
  #
  def task_list_unwatch_icon
    icon('icon-eye-close')
  end

  # Produces a link to start watching/unwatching the task list passed as argument
  #
  def link_to_watch(task_list, user=current_user)
    return unless task_list.can_be_watched_by?(user)

    if user.watches?(task_list)
      task_list_unwatch_icon + link_to('Unwatch', watched_task_list_path(task_list),
                                       method: :delete)
    else
      task_list_watch_icon + link_to('Watch', watched_task_lists_path(id: task_list.id), 
                                     method: :post)
    end
  end
end
