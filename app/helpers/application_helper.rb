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
      # If the association is called +:books+, the rendered partial will be
      # +books/book_fields+
      render("#{association.to_s}/" + association.to_s.singularize + '_fields', builder: f)
    end

    link_to text, '#', class: 'add_fields', data: { id: id, fields: fields.gsub("\n", '') }
  end

end
