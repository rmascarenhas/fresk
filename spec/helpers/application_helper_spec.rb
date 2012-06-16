require 'spec_helper'

describe ApplicationHelper do
  describe '#icon' do
    it 'builds an empty tag with given class' do
      helper.icon('test').should eq('<i class="test icon-large"></i>')
    end
  end

  describe '#link_to_add_fields' do
    let :builder do
      builder = stub(object: builder_object)
      builder.stub(simple_fields_for: fields)

      builder
    end

    let :builder_object do
      stub(tests: association_objects)
    end

    let :fields do
      'fields'
    end

    let :association_objects do
      stub(build: Object.new)
    end

    let :link do
      link = helper.link_to_add_fields('test', form_builder: builder, association: :tests)
    end

    it 'contains the association object id' do
      link.should =~ /#{association_objects.build.object_id}/
    end

    it 'creates a link with generated fields' do
      link.should =~ /fields/
    end
  end
end
