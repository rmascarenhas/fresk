module Users

  class TasksController < BaseController

    def index
      @task_list = get_task_list
      redirect_to @task_list
    end

    def new
      @task_list = get_task_list
      @task      = @task_list.tasks.build
    end

    def create
      @task_list = get_task_list
      @task      = @task_list.tasks.create(params[:task])
      @task.save

      respond_with(@task) do |format|
        format.html { redirect_to @task_list }
      end
    end

  end

end
