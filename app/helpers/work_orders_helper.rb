module WorkOrdersHelper

  def priority(work_order)
    html = ""
    if work_order.priority == 1
      html << "<tr class=""priority"">"
    else
      html << "<tr>"
    end
    html.html_safe
  end
  
  def yes_no(input)
    if input == 0 
      "No"
    else
      "Yes"
    end
  end
  
  def next_stage(work_order)
    html = ""
    if work_order.status == "New"
      html << button_to("Received", :action => "received", :id => work_order.id )
    elsif work_order.status =="Received"
      html << button_to("Started", :action => 'started', :id => work_order.id )
    elsif work_order.status =="Started"
      html << button_to("Finished", :action => 'finished', :id => work_order.id )
    elsif work_order.status =="Finished"
      html << button_to("Delivered", :action => 'delivered', :id => work_order.id )
    end
    html.html_safe
  end
  
  def times(work_order)
    html = ""
    @id = work_order.id
    
    @created = work_order.created_at.localtime.strftime("%m/%d %I:%M %p")
    if work_order.received != nil
      @received = work_order.received.localtime.strftime("%m/%d %I:%M %p")  
    end
    if work_order.started != nil
      @started = work_order.started.localtime.strftime("%m/%d %I:%M %p")  
    end
    if work_order.finished != nil
      @finished = work_order.finished.localtime.strftime("%m/%d %I:%M %p")  
    end
    if work_order.delivered != nil
      @delivered = work_order.delivered.localtime.strftime("%m/%d %I:%M %p")  
    end 
  
    
    if work_order.status == "New"
      html << "<tr><td>Created</td><td>#{@created}</td></tr><tr><td colspan='2'>#{button_to("Received", :action => "received", :id => work_order.id )}</td></tr>"
    elsif work_order.status =="Received"
      html << "<tr><td>Created</td><td>#{@created}</td></tr><tr><td>Received</td><td>#{@received}</td></tr><tr><td colspan='2'>#{button_to("Started", :action => 'started', :id => work_order.id )}</td></tr>"
    elsif work_order.status =="Started"
      html << "<tr><td>Created</td><td>#{@created}</td></tr><tr><td>Received</td><td>#{@received}</td></tr><tr><td>Started</td><td>#{@started}</td></tr><tr><td colspan='2'>#{button_to("Finished", :action => 'finished', :id => work_order.id )}</td></tr>"
    elsif work_order.status =="Finished"
      html << "<tr><td>Created</td><td>#{@created}</td></tr><tr><td>Received</td><td>#{@received}</td></tr><tr><td>Started</td><td>#{@started}</td></tr><tr><td>Finished</td><td>#{@finished}</td></tr><tr><td colspan='2'>#{button_to("Delivered", :action => 'delivered', :id => work_order.id )}</td></tr>"
    elsif work_order.status =="Delivered"
      html << "<tr><td>Created</td><td>#{@created}</td></tr><tr><td>Received</td><td>#{@received}</td></tr><tr><td>Started</td><td>#{@started}</td></tr><tr><td>Finished</td><td>#{@finished}</td></tr><tr><td>Delivered</td><td>#{@delivered}</td></tr>"
    end
    html.html_safe
  end  
  
  def assign_html(work_order)
    html = html
    if work_order.status == "Received"
      html = "Who Received <strong>#{work_order.year} #{work_order.make.name} #{work_order.model.name}</strong> from <strong>#{work_order.client.business_name}</strong> Stock ##{work_order.stock_number}<br />"
    elsif work_order.status == "Started"
      html = "Who is Detailing <strong>#{work_order.year} #{work_order.make.name} #{work_order.model.name}</strong> from <strong>#{work_order.client.business_name}</strong> Stock ##{work_order.stock_number}<br />"
    elsif work_order.status == "Finished"      
      html = "Confirm Detailers for <strong>#{work_order.year} #{work_order.make.name} #{work_order.model.name}</strong> from <strong>#{work_order.client.business_name}</strong> Stock ##{work_order.stock_number}<br />"
    elsif work_order.status == "Delivered"
      html = "Who Delivered <strong>#{work_order.year} #{work_order.make.name} #{work_order.model.name}</strong> to <strong>#{work_order.client.business_name}</strong> Stock ##{work_order.stock_number}<br />"
    end
  html.html_safe
  end
end
