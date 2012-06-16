module TasksHelper

  # Outputs the time remaining to the given task deadline or a label indicating that
  # it has already expired.
  #
  def task_status(task)
    if task.expired?
      expired_task
    else
      valid_task_with_remaining_time(distance_of_time_in_words_to_now(task.deadline))
    end
  end

  private
  
  def expired_task
    content_tag :span, 'Expired', class: 'label label-important'
  end

  def valid_task_with_remaining_time(time)
    "<b>Time remaining:</b> #{time}".html_safe
  end
end
