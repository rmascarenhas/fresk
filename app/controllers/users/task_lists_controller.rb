module Users

  class TaskListsController < BaseController

    def index
      @task_lists = current_user.task_lists
    end

    def new
      @task_list = current_user.task_lists.build
    end

    def edit
      @task_list = get_task_list
    end

    def show
      @task_list = get_task_list
    end

    def create
      @task_list = current_user.task_lists.build(params[:task_list])
      @task_list.save

      respond_with(@task_list)
    end

    def update
      @task_list = get_task_list
      @task_list.update_attributes(params[:task_list])

      respond_with(@task_list)
    end

    def destroy
      @task_list = get_task_list
      @task_list.destroy

      respond_with(@task_list)
    end

  end
end
