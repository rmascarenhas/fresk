require 'spec_helper'

describe TaskList do
  describe 'validations' do
    it 'should not validate a task list with blank name' do
      ['', ' ', nil].each do |invalid_name|
        TaskList.new(name: invalid_name).should_not be_valid
      end
    end
  end

  describe 'public availability' do
    it 'should be public by default' do
      TaskList.new.should be_public
    end

    it 'should not be private if it is public' do
      TaskList.new.should_not be_private
    end

    it 'should be private if it is not public' do
      list = TaskList.new(public: false).should be_private
    end
  end
end
