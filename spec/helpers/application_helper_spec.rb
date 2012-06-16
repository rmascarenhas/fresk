require 'spec_helper'

describe ApplicationHelper do
  describe '#icon' do
    it 'builds an empty tag with given class' do
      helper.icon('test').should eq('<i class="test icon-large"></i>')
    end
  end
end
