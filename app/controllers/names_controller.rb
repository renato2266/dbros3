class NamesController < ApplicationController
  # GET /names
  # GET /names.xml
  before_filter :authenticate_user!, :only => [:edit, :new]
  before_filter :authenticate_admin!, :only => [ :destroy]

  helper_method :sort_column, :sort_direction

  respond_to :html, :xml

  def index

    #@names = Name.order("cognome_nome desc").limit(3) 
    @names = Name.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 3, :page => params[:page])
    #@names = Name.where("luogo_nascita LIKE '%mi%'").paginate(:per_page => 3, :page => params[:page])

    respond_with @names
  end



  # GET /names/1
  # GET /names/1.xml
  def show
    @name = Name.find(params[:id])
    @area = @name.area
    @ambit = @name.ambit
    @association = @name.association
    @dossiers = @name.dossiers
    @fascicles = @name.fascicles
    @galleries = @name.galleries
    @investigations = @name.investigations
    @unions = @name.unions


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @name }
      format.pdf { render :layout => false }
    end
  end

  # GET /names/new
  # GET /names/new.xml
  def new
    @name = Name.new
    @areas = Area.order("area_criminale ASC")
    @ambits = Ambit.order("ambito_criminale ASC")
    @associations = Association.order("associazione_criminale ASC")
    @dossiers = Dossier.all
    @unions = Union.order("denominazione ASC")
    @investigations = Investigation.order("indagine ASC")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @name }
    end
  end

  # GET /names/1/edit
  def edit
    @name = Name.find(params[:id])
    @areas = Area.order("area_criminale ASC")
    @ambits = Ambit.order("ambito_criminale ASC")
    @associations = Association.order("associazione_criminale ASC")
    @dossiers = Dossier.all
    @unions = Union.order("denominazione ASC")
    @investigations = Investigation.order("indagine ASC")
  end

  # POST /names
  # POST /names.xml
  def create
    @name = Name.new(params[:name])


    respond_to do |format|
      if @name.save

        format.html { redirect_to(@name, :notice => 'Name was successfully created.') }
        format.xml  { render :xml => @name, :status => :created, :location => @name }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /names/1
  # PUT /names/1.xml
  def update
    @name = Name.find(params[:id])

    respond_to do |format|
      if @name.update_attributes(params[:name])
        format.html { redirect_to(@name, :notice => 'Name was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /names/1
  # DELETE /names/1.xml
  def destroy
    @name = Name.find(params[:id])
    @name.destroy

    respond_to do |format|
      format.html { redirect_to(names_url) }
      format.xml  { head :ok }
    end
  end

  def names_search

  end

  def show_search_results
    search_fields = params[:search_fields]

    condizioni = []
    valori = {}
    unless search_fields.nil?
      search_fields.each do |campo, valore|
        next if valore.blank?
        condizioni << "#{campo} like :#{campo}"
        valori[campo.intern] = "%#{valore}%"
      end
    end

    unless params[:data_field].blank?
      data = params[:data_field][:data_nascita]
      logger.debug "data = #{data}"
    end

    #logger.debug "condizioni #{condizioni}"

    @names = Name.where(condizioni.join("AND"), valori).paginate(:per_page => 3, :page => params[:page])
  end

  private
  def sort_column
    Name.column_names.include?(params[:sort]) ? params[:sort] : "cognome_nome"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end



