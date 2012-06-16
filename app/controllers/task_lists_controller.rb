class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.all
  end

  def new
    @task_list = TaskList.new
  end

  def edit
    @task_list = TaskList.find(params[:id])
  end

  def show
    @task_list = TaskList.find(params[:id])
  end

  def create
    @task_list = TaskList.new(params[:task_list])
    @task_list.save

    respond_with(@task_list)
  end

  def update
    @task_list = TaskList.find(params[:id])
    @task_list.update_attributes(params[:task_list])

    respond_with(@task_list)
  end

end
