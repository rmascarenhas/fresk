class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.all
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(params[:task_list])
    @task_list.save

    respond_with(@task_list)
  end

end
