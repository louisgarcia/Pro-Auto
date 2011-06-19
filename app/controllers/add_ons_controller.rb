class AddOnsController < ApplicationController
  # GET /add_ons
  # GET /add_ons.xml
  def index
    @add_ons = AddOn.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @add_ons }
    end
  end

  # GET /add_ons/1
  # GET /add_ons/1.xml
  def show
    @add_on = AddOn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @add_on }
    end
  end

  # GET /add_ons/new
  # GET /add_ons/new.xml
  def new
    @add_on = AddOn.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @add_on }
    end
  end

  # GET /add_ons/1/edit
  def edit
    @add_on = AddOn.find(params[:id])
  end

  # POST /add_ons
  # POST /add_ons.xml
  def create
    @add_on = AddOn.new(params[:add_on])

    respond_to do |format|
      if @add_on.save
        format.html { redirect_to(@add_on, :notice => 'Add on was successfully created.') }
        format.xml  { render :xml => @add_on, :status => :created, :location => @add_on }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @add_on.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /add_ons/1
  # PUT /add_ons/1.xml
  def update
    @add_on = AddOn.find(params[:id])

    respond_to do |format|
      if @add_on.update_attributes(params[:add_on])
        format.html { redirect_to(@add_on, :notice => 'Add on was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @add_on.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /add_ons/1
  # DELETE /add_ons/1.xml
  def destroy
    @add_on = AddOn.find(params[:id])
    @add_on.destroy

    respond_to do |format|
      format.html { redirect_to(add_ons_url) }
      format.xml  { head :ok }
    end
  end
end
