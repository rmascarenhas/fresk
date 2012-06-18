module Users

  class BaseController < ApplicationController
    before_filter :authenticate_user!

    def index
    end

    private

    def get_task_list
      task_list = TaskList.find(params[:task_list_id] || params[:id])

      if task_list.can_be_visited_by?(current_user)
        task_list
      else
        render_404
      end
    end
  end

end
