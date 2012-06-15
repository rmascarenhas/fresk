class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.all
  end

end
