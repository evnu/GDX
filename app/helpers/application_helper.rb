module ApplicationHelper
  def highlight_link(page_name)
    if params[:controller] == page_name
      "current_page_item"
    else
      "page_item page-item-2"
    end
  end
end
