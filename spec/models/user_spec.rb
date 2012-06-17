require 'spec_helper'

describe User do
  describe 'validations' do
    it 'is valid with all attributes' do
      build(:user).should be_valid
    end

    it 'is not valid with blank name, username or email' do
      no_blank_attribute_for(:name)
      no_blank_attribute_for(:username)
      no_blank_attribute_for(:email)
    end

    it 'is not valid with a taken email' do
      create(:user, email: 'test@example.com')
      build(:user, email: 'test@example.com').should_not be_valid
    end

    it 'is not valid with taken username' do
      create(:user, username: 'test')
      build(:user, username: 'test').should_not be_valid
    end

    def no_blank_attribute_for(attribute)
      ['', ' ', nil].each do |invalid_attribute|
        build(:user, attribute => invalid_attribute).should_not be_valid
      end
    end
  end
end
