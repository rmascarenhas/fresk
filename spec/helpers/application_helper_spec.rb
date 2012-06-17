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

  describe '#prepended_text_field' do
    let :form_builder do
      Object.new
    end

    it 'creates an input with "prepend" wrapper' do
      form_builder.should_receive(:input).with('attr', wrapper: :prepend, label: false)
      text_field = helper.prepended_text_field('attr', form_builder) do
        'test'
      end
    end
  end

  describe '#stylize_flash_message' do
    it 'creates an alert-success on :notice level' do
      alert_box = helper.stylize_flash_message(:notice, 'Foo')
      alert_box.should =~ /alert-success/
    end

    it 'creates an alert info on :alert level' do
      alert_box = helper.stylize_flash_message(:alert, 'Foo')
      alert_box.should =~ /alert-info/
    end

    it 'creates an alert block on unknown levels' do
      alert_box = helper.stylize_flash_message(:mystery, 'Foo')
      alert_box.should =~ /alert-block/
    end
  end
end
