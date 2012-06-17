module Users

  class BaseController < ApplicationController
    before_filter :authenticate_user!

    def index
    end

    private

    def get_task_list
      current_user.task_lists.find(params[:task_list_id] || params[:id])
    end
  end

end
