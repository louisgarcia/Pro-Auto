class WorkOrdersController < ApplicationController
  # GET /work_orders
  # GET /work_orders.xml
  def index
 
  @filters = WorkOrder::FILTERS
  if params[:show] && @filters.collect{|f| f[:scope]}.include?(params[:show])
    @work_orders = WorkOrder.send(params[:show])
  else
    @work_orders = WorkOrder.all
  end  

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @work_orders }
    end
  end

  # GET /work_orders/1
  # GET /work_orders/1.xml
  def show
    @work_order = WorkOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work_order }
    end
  end

  # GET /work_orders/new
  # GET /work_orders/new.xml
  def new
    @work_order = WorkOrder.new
    @work_order.jobs.build
    @makes = Make.find(:all, :order => "name")
    @makes_for_select = @makes.map{|m| [m.name, m.id]}
    @clients = Client.find(:all, :order => "business_name")
    @clients_for_select = @clients.map{|c| [c.business_name, c.id]}

    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work_order }
    end
  end

  # GET /work_orders/1/edit
  def edit
      
    @work_order = WorkOrder.find(params[:id])
    
    @work_order.jobs.build
     
    @makes = Make.find(:all, :order => "name")
    @makes_for_select = @makes.map{|m| [m.name, m.id]}
    @clients = Client.find(:all, :order => "business_name")
    @clients_for_select = @clients.map{|c| [c.business_name, c.id]}
    @employees = Employee.find(:all, :order => "first_name")
    @employees_for_select = @employees.map{|e| [e.first_name, e.id]}
  end

  # POST /work_orders
  # POST /work_orders.xml
  def create
    
    @work_order = WorkOrder.new(params[:work_order])
    @makes = Make.find(:all, :order => 'name')
    @makes_for_select = @makes.map{|m| [m.name, m.id]}
    @clients = Client.find(:all, :order => 'business_name')
    @clients_for_select = @clients.map{|c| [c.business_name, c.id]}

    respond_to do |format|
      if @work_order.save
        format.html { redirect_to(@work_order, :notice => 'Work Order Created.') }
        format.xml  { render :xml => @work_order, :status => :created, :location => @work_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /work_orders/1
  # PUT /work_orders/1.xml
  def update
    
      
      
          @work_order = WorkOrder.find(params[:id])

    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        format.html { redirect_to(@work_order, :notice => 'Work order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
end
  # DELETE /work_orders/1
  # DELETE /work_orders/1.xml
  def destroy
    @work_order = WorkOrder.find(params[:id])
    @work_order.destroy

    respond_to do |format|
      format.html { redirect_to(work_orders_url) }
      format.xml  { head :ok }
    end
  end
  
  def received
    @work_order = WorkOrder.find(params[:id])
    @work_order.received = Time.zone.now.to_datetime
    @work_order.status = "Received"
    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        format.html { redirect_to(:back, :notice => 'Work Order Recieved.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def started
    @work_order = WorkOrder.find(params[:id])
    @work_order.started = Time.zone.now.to_datetime
    @work_order.status = "Started"
    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        format.html { redirect_to(:back, :notice => 'Work Order Started.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def finished
    @work_order = WorkOrder.find(params[:id])
    @work_order.finished = Time.zone.now.to_datetime
    @work_order.status = "Finished"
    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        format.html { redirect_to(:back, :notice => 'Work Order Finished.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def delivered
    @work_order = WorkOrder.find(params[:id])
    @work_order.delivered = Time.zone.now.to_datetime
    @work_order.status = "Delivered"
    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        format.html { redirect_to(:back, :notice => 'Work Order Finished.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  

  

end
