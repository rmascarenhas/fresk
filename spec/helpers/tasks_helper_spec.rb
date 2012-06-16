require 'spec_helper'

describe TasksHelper do
  describe '#task_status' do
    let :valid_task do
      Task.new(deadline: 3.days.from_now)
    end

    let :expired_task do
      Task.new(deadline: 3.days.ago)
    end

    it 'outputs remaining time with valid task' do
      helper.task_status(valid_task).should =~ /3 days/
    end

    it 'allerts task expiration with expired task' do
      helper.task_status(expired_task).should =~ /Expired/
    end
  end
end
