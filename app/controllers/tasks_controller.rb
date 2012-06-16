class TasksController < ApplicationController

  def index
    @task_list = TaskList.find(params[:task_list])
    redirect_to @task_list
  end

  def new
    @task_list = TaskList.find(params[:task_list_id])
    @task      = @task_list.tasks.build
  end

  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task      = @task_list.tasks.create(params[:task])
    @task.save

    respond_with(@task) do |format|
      format.html { redirect_to @task_list }
    end
  end

end
