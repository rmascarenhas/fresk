require 'spec_helper'

describe TaskListsHelper do
  describe '#task_list_icon' do
    it 'displays an open eye icon when task list is public' do
      task_list = TaskList.new
      helper.task_list_icon(task_list).should =~ /unlock/
    end

    it 'displays a closed eye when task list is private' do
      task_list = TaskList.new(public: false)
      helper.task_list_icon(task_list).should =~ /lock/
    end
  end

  describe '#link_to_watch' do
    let :user do
      create(:user)
    end

    let :task_list do
      create(:task_list)
    end

    it 'links to watch if user is not watching the task_list' do
      helper.link_to_watch(task_list, user).should =~ /Watch/
    end

    it 'links to unwatch if the user is already watching the task list' do
      user.watched_task_lists << task_list
      helper.link_to_watch(task_list, user).should =~ /Unwatch/
    end
  end
end
