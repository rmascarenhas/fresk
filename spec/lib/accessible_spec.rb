require 'spec_helper'

describe Accessible do
  describe Accessible::Rules do
    let :rules do
      Accessible::Rules.new
    end

    it 'returns true with no registered rules' do
      rules.apply('fake').should be_true
    end

    it 'returns false when one condition is not met' do
      rules.add { |n| n > 10 }
      rules.add { |n| n > 5 }

      rules.apply(6).should be_false
    end

    it 'returns true when all conditions are met' do
      rules.add { |n| n > 10 }
      rules.add { |n| n > 5 }

      rules.apply(15).should be_true
    end
  end
end
