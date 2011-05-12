class UnionsController < ApplicationController
  # GET /unions
  # GET /unions.xml
  before_filter :authenticate_user!, :except => [:show, :index]
  
  helper_method :sort_column, :sort_direction
  def index
    @unions = Union.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 3, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unions }
    end
  end

  # GET /unions/1
  # GET /unions/1.xml
  def show
    @union = Union.find(params[:id])
    @area = @union.area
    @dossiers = @union.dossiers
    @names = @union.names
    @fascicles = @union.fascicles

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @union }
    end
  end

  # GET /unions/new
  # GET /unions/new.xml
  def new
    @union = Union.new
   @areas = Area.order("area_criminale ASC")
    @names = Name.order("cognome_nome ASC")
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @union }
    end
  end

  # GET /unions/1/edit
  def edit
    @union = Union.find(params[:id])
    @areas = Area.order("area_criminale ASC")
    @names = Name.order("cognome_nome ASC")
  end

  # POST /unions
  # POST /unions.xml
  def create
    @union = Union.new(params[:union])

    respond_to do |format|
      if @union.save
        format.html { redirect_to(@union, :notice => 'Union was successfully created.') }
        format.xml  { render :xml => @union, :status => :created, :location => @union }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @union.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unions/1
  # PUT /unions/1.xml
  def update
    @union = Union.find(params[:id])

    respond_to do |format|
      if @union.update_attributes(params[:union])
        format.html { redirect_to(@union, :notice => 'Union was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @union.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unions/1
  # DELETE /unions/1.xml
  def destroy
    @union = Union.find(params[:id])
    @union.destroy

    respond_to do |format|
      format.html { redirect_to(unions_url) }
      format.xml  { head :ok }
    end
  end
end

 private
  def sort_column  
  Union.column_names.include?(params[:sort]) ? params[:sort] : "denominazione"  
end
  def sort_direction  
  %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
end 

