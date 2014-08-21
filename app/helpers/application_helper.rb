module ApplicationHelper
  def page_title
    title = @list ? " | #{@list.name}" : ''
    %(TallyDo #{title})
  end
end
