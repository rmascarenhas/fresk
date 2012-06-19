module ApplicationHelper

  # Creates an icon from the font-awesome package. Expects the correspondent
  # class name of the icon.
  #
  def icon(icon_name)
    content_tag(:i, nil, class: "#{icon_name} icon-large")
  end

  # Creates a link that will produce a nested form for the passed association.
  # It uses the new association object id as the id of the child, that then must
  # be replaced with the current time by JavaScript, so that we have a unique index
  # for each association object.
  #
  # Assumes there is a partial called +<association>_fields+.
  #
  # Options:
  #   form_builder:       the form builder to be used to generate the new object fields
  #   association:        the name of the association
  #
  # Adapted from Railscasts #196 and 
  # http://stackoverflow.com/questions/2879208/rails-fields-for-child-index-option-explanation
  #
  def link_to_add_fields(text, options)
    builder, association = options[:form_builder], options[:association]

    association_object = builder.object.send(association).build
    id = association_object.object_id

    fields = builder.simple_fields_for(association, association_object, child_index: id) do |f|
      render(association.to_s.singularize + '_fields', builder: f)
    end

    link_to text, '#', class: 'add_fields', data: { id: id, fields: fields.gsub("\n", '') }
  end

  # Creates a text field prepended by the content passed in the block to this method.
  #
  def prepended_text_field(attribute, form_builder, &block)
    form_builder.input attribute, wrapper: :prepend, label: false do
      capture(&block)
    end
  end

  # Creates an alert box to the passed flash message, using different styles 
  # depending on the flash message level.
  #
  def stylize_flash_message(level, message)
    return if message.nil?

    css_map = {
      notice: 'alert alert-success',
      alert: 'alert alert-info'
    }
    css_map.default = 'alert alert-block'

    content_tag :div, class: 'row' do
      content_tag :div, message, class: css_map[level.to_sym]
    end
  end

  # Instantiates a presenter to be used in the views. The presenter to be
  # used is guessed from the class of the object passed. It is assumed to
  # be in the form <object_class>Presenter. If that is not the case, a
  # presenter class can be passed as a second argument.
  #
  def present(object, presenter_class=nil)
    presenter_class ||= "#{object.class.name}Presenter".constantize
    presenter = presenter_class.new(object, self)

    yield presenter if block_given?
  end
end
