module Users

  class TaskListsController < UsersController
    before_filter :get_task_list, only: [:edit, :show, :update, :destroy]

    def index
      @task_lists = TaskList.all
    end

    def new
      @task_list = TaskList.new
    end

    def edit
      @task_list = get_task_list
    end

    def show
      @task_list = get_task_list
    end

    def create
      @task_list = TaskList.new(params[:task_list])
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

    private

    def get_task_list
      TaskList.find(params[:id])
    end

  end
end
