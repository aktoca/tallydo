module ApplicationHelper

  def page_title
    title = @list ? " | #{@list.name}" : ''
    %(TallyDo #{title})
  end

  def all_types
    ['Movie', 'Book', 'Location', 'Tv_Show'] 
  end


  def percent_done(tasks)
    ((tasks.tallied.length.to_d / tasks.length.to_d) * 100).round() 
  end
  
end
