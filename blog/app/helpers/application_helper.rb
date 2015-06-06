module ApplicationHelper

  def pagination_links(class_name, route = "/home/")
    html = []
    html << '<div class="btn-group" role="group">'
    unless params[:page] == 1
      html << "<a href=\"#{route}#{params[:page] - 1}\" class=\"btn btn-primary\"><span class=\"fa fa-arrow-left\"></span></a>"
    end
    if params[:page]*class_name::PER_PAGE < class_name.count
      html << "<a href=\"#{route}#{params[:page] + 1}\" class=\"btn btn-primary\"><span class=\"fa fa-arrow-right\"></span>
</a>"
    end
    html << '</div>'
    html.join(" ").html_safe
  end

end
