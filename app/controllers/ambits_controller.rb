class AmbitsController < ApplicationController
  # GET /ambits
  # GET /ambits.xml
   before_filter :authenticate_admin!, :only => [:new, :edit, :destroy]
  def index
    @ambits = Ambit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ambits }
    end
  end

  # GET /ambits/1
  # GET /ambits/1.xml
  def show
    @ambit = Ambit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ambit }
    end
  end

  # GET /ambits/new
  # GET /ambits/new.xml
  def new
    @ambit = Ambit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ambit }
    end
  end

  # GET /ambits/1/edit
  def edit
    @ambit = Ambit.find(params[:id])
  end

  # POST /ambits
  # POST /ambits.xml
  def create
    @ambit = Ambit.new(params[:ambit])

    respond_to do |format|
      if @ambit.save
        format.html { redirect_to(@ambit, :notice => 'Ambit was successfully created.') }
        format.xml  { render :xml => @ambit, :status => :created, :location => @ambit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ambit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ambits/1
  # PUT /ambits/1.xml
  def update
    @ambit = Ambit.find(params[:id])

    respond_to do |format|
      if @ambit.update_attributes(params[:ambit])
        format.html { redirect_to(@ambit, :notice => 'Ambit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ambit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ambits/1
  # DELETE /ambits/1.xml
  def destroy
    @ambit = Ambit.find(params[:id])
    @ambit.destroy

    respond_to do |format|
      format.html { redirect_to(ambits_url) }
      format.xml  { head :ok }
    end
  end
end
