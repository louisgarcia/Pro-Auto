module WorkOrdersHelper
  def yes_no(input)
    if input == 0 
      "No"
    else
      "Yes"
    end
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
      html << "<td>#{button_to("Received", :action => "received", :id => work_order.id )}</td><td></td><td></td><td></td>"
    elsif work_order.status =="Received"
      html << "<td>#{@received}</td><td>#{button_to("Started", :action => 'started', :id => work_order.id )}</td><td></td><td></td>"
    elsif work_order.status =="Started"
      html << "<td>#{@received}</td><td>#{@started}</td><td>#{button_to("Finished", :action => 'finished', :id => work_order.id )}</td><td></td>"
    elsif work_order.status =="Finished"
      html << "<td>#{@received}</td><td>#{@started}</td><td>#{@finished}</td><td>#{button_to("Delivered", :action => 'delivered', :id => work_order.id )}</td>"
    elsif work_order.status =="Delivered"
      html << "<td>#{@received}</td><td>#{@started}</td><td>#{@finished}</td><td>#{@delivered}</td>"
    end
    html.html_safe
  end  
end
