class NameSocietiesController < ApplicationController
  # GET /name_societies
  # GET /name_societies.xml
  def index
    @name_societies = NameSociety.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @name_societies }
    end
  end

  # GET /name_societies/1
  # GET /name_societies/1.xml
  def show
    @name_society = NameSociety.find(params[:id])
    @name = @name_society.name
    @society = @name_society.society


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @name_society }
    end
  end

  # GET /name_societies/new
  # GET /name_societies/new.xml
  def new
    @name_society = NameSociety.new
    @names = Name.find(:all, :order => "cognome_nome ASC")
    @societies = Society.find(:all, :order => "denominazione ASC")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @name_society }
    end
  end

  # GET /name_societies/1/edit
  def edit
    @name_society = NameSociety.find(params[:id])
     @names = Name.find(:all, :order => "cognome_nome ASC")
    @societies = Society.find(:all, :order => "denominazione ASC")

  end

  # POST /name_societies
  # POST /name_societies.xml
  def create
    @name_society = NameSociety.new(params[:name_society])

    respond_to do |format|
      if @name_society.save
        format.html { redirect_to(@name_society, :notice => 'Name society was successfully created.') }
        format.xml  { render :xml => @name_society, :status => :created, :location => @name_society }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @name_society.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /name_societies/1
  # PUT /name_societies/1.xml
  def update
    @name_society = NameSociety.find(params[:id])

    respond_to do |format|
      if @name_society.update_attributes(params[:name_society])
        format.html { redirect_to(@name_society, :notice => 'Name society was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @name_society.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /name_societies/1
  # DELETE /name_societies/1.xml
  def destroy
    @name_society = NameSociety.find(params[:id])
    @name_society.destroy

    respond_to do |format|
      format.html { redirect_to(name_societies_url) }
      format.xml  { head :ok }
    end
  end
end
