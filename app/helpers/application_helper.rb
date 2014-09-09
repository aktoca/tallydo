module ApplicationHelper

  def page_title
    title = @list ? " | #{@list.name}" : ''
    %(TallyDo #{title})
  end

  def all_types
    ['Movie', 'Book', 'Location', 'Tv_Show'] 
  end




end
