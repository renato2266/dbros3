class DossiersController < ApplicationController
  # GET /dossiers
  # GET /dossiers.xml
  before_filter :authenticate_user!, :except => [:show, :index]
  
  helper_method :sort_column, :sort_direction
  
  def index
    @dossiers = Dossier.order(sort_column + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dossiers }
    end
  end

  # GET /dossiers/1
  # GET /dossiers/1.xml
  def show
    @dossier = Dossier.find(params[:id])
    @names = @dossier.names
   	@unions = @dossier.unions 

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dossier }
    end
  end

  # GET /dossiers/new
  # GET /dossiers/new.xml
  def new
    @dossier = Dossier.new
     @names = Name.order("cognome_nome ASC")
     @unions = Union.order("denominazione ASC")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dossier }
    end
  end

  # GET /dossiers/1/edit
  def edit
    @dossier = Dossier.find(params[:id])
    @names = Name.order("cognome_nome ASC")
     @unions = Union.order("denominazione ASC")
  end

  # POST /dossiers
  # POST /dossiers.xml
  def create
    @dossier = Dossier.new(params[:dossier])

    respond_to do |format|
      if @dossier.save
        format.html { redirect_to(@dossier, :notice => 'Dossier was successfully created.') }
        format.xml  { render :xml => @dossier, :status => :created, :location => @dossier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dossier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dossiers/1
  # PUT /dossiers/1.xml
  def update
    @dossier = Dossier.find(params[:id])

    respond_to do |format|
      if @dossier.update_attributes(params[:dossier])
        format.html { redirect_to(@dossier, :notice => 'Dossier was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dossier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dossiers/1
  # DELETE /dossiers/1.xml
  def destroy
    @dossier = Dossier.find(params[:id])
    @dossier.destroy

    respond_to do |format|
      format.html { redirect_to(dossiers_url) }
      format.xml  { head :ok }
    end
  end
end

private
  def sort_column
    Dossier.column_names.include?(params[:sort]) ? params[:sort] : "data"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
