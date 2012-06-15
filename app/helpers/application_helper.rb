module ApplicationHelper

  # Creates an icon from the font-awesome package. Expects the correspondent
  # class name of the icon.
  #
  def icon(icon_name)
    content_tag(:i, nil, class: icon_name)
  end

end
