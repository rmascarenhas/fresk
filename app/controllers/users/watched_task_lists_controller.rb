module Users

  class WatchedTaskListsController < BaseController

    def index
      @watched_task_lists = current_user.watched_task_lists
      respond_with(@watched_task_lists)
    end

    def create
      @task_list = TaskList.public_lists.find(params[:id])
      render_404 unless @task_list.can_be_watched_by?(current_user)

      current_user.watched_task_lists << @task_list
      flash[:notice] = "You are now watching #{@task_list.name}"

      redirect_to watched_task_lists_path
    end

    def destroy
      @task_list = TaskList.public_lists.find(params[:id])
      current_user.watched_task_lists.delete(@task_list)
      flash[:notice] = "You are no longer watching #{@task_list.name}"

      redirect_to watched_task_lists_path
    end

  end

end
