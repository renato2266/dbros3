class InvestigationsController < ApplicationController
  # GET /investigations
  # GET /investigations.xml
  def index
    @investigations = Investigation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @investigations }
    end
  end

  # GET /investigations/1
  # GET /investigations/1.xml
  def show
    @investigation = Investigation.find(params[:id])
    @names = @investigation.names

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @investigation }
    end
  end

  # GET /investigations/new
  # GET /investigations/new.xml
  def new
    @investigation = Investigation.new
    @names = Name.order("cognome_nome asc")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @investigation }
    end
  end

  # GET /investigations/1/edit
  def edit
    @investigation = Investigation.find(params[:id])
    @names = Name.order("cognome_nome asc")
  end

  # POST /investigations
  # POST /investigations.xml
  def create
    @investigation = Investigation.new(params[:investigation])

    respond_to do |format|
      if @investigation.save
        format.html { redirect_to(@investigation, :notice => 'Investigation was successfully created.') }
        format.xml  { render :xml => @investigation, :status => :created, :location => @investigation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @investigation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /investigations/1
  # PUT /investigations/1.xml
  def update
    @investigation = Investigation.find(params[:id])

    respond_to do |format|
      if @investigation.update_attributes(params[:investigation])
        format.html { redirect_to(@investigation, :notice => 'Investigation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @investigation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /investigations/1
  # DELETE /investigations/1.xml
  def destroy
    @investigation = Investigation.find(params[:id])
    @investigation.destroy

    respond_to do |format|
      format.html { redirect_to(investigations_url) }
      format.xml  { head :ok }
    end
  end
end
