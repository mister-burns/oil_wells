module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize

    css_class = if (column == sort_column) then
                  "current #{sort_direction}"
                else
                  nil
                end

    direction = if column == sort_column && sort_direction == "asc" then
                  "desc"
                else
                  "asc"
                end

    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

end
