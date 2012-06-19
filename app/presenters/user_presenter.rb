# The +Users::IndexPresenter+ class is used to build the user index page,
# accessed after the user signs in. It contains lots of information, such as
# the tasks created by the user, its task lists and the upcoming tasks of
# his watched task lists.
#
class UserPresenter

  attr_accessor :user, :t

  # Creates a new instance of the presenter, which will present the passed
  # user.
  #
  def initialize(user, template)
    @user = user
    @t    = template
  end

  # Returns the user's upcoming tasks from his own task lists, ordered
  # from most to least urgent.
  #
  def upcoming_tasks
    tasks = get_upcoming_tasks

    t.render(partial: 'upcoming_task', collection: tasks, as: :task) ||
      'There are no upcoming tasks.'
  end

  # Fetches the tasks from task lists watched by the user and returns them
  # from most to least urgent.
  #
  def upcoming_watched_tasks
    tasks = get_upcoming_watched_tasks

    t.render(partial: 'upcoming_watched_task', collection: tasks, as: :task) ||
      'There are no watched upcoming tasks.'
  end

  private

  def get_upcoming_tasks
    Task.includes(task_list: :owner).where(task_list_id: user.task_list_ids)
  end

  def get_upcoming_watched_tasks
    Task.includes(task_list: :owner).where(task_list_id: user.watched_task_list_ids)
  end

end
