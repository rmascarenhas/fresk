require 'spec_helper'

describe TaskListsHelper do
  describe '#task_list_icon' do
    it 'displays an open eye icon when task list is public' do
      task_list = TaskList.new
      helper.task_list_icon(task_list).should =~ /eye-open/
    end

    it 'displays a closed eye when task list is private' do
      task_list = TaskList.new(public: false)
      helper.task_list_icon(task_list).should =~ /eye-close/
    end
  end
end
