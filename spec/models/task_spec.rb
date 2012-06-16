require 'spec_helper'

describe Task do
  describe 'validations' do
    it 'is not valid with a blank description' do
      ['', ' ', nil].each do |invalid_description|
        Task.new(description: invalid_description).should_not be_valid
      end
    end

    it 'is not valid with no deadline' do
      Task.new(description: 'test task').should_not be_valid
    end

    it 'is valid with description and deadline' do
      Task.new(description: 'test task', deadline: 1.day.from_now).should be_valid
    end

    it 'is not valid if its description is present in task list' do
      list = TaskList.new(name: 'test')
      list.save

      list.tasks.create!(description: 't', deadline: 1.day.from_now)
      task = list.tasks.create(description: 't', deadline: 1.day.from_now)

      task.should_not be_valid
    end
  end

  describe '#expire' do
    it 'is not expired if its deadline is in the future' do
      Task.new(deadline: 1.day.from_now).should_not be_expired
    end

    it 'is expired it its deadline has already passed' do
      Task.new(deadline: 1.day.ago).should be_expired
    end
  end
end
