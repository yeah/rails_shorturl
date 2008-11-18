class LinksController < ApplicationController
  # GET /links
  # GET /links.xml
  def index
    redirect_to new_link_path
  end

  # GET /links/1
  # GET /links/1.xml
  def show
    @link = Link.find_by_short(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @link }
    end
  end

  def redirect
    if params[:id].blank?
      redirect_to new_link_path
    elsif @link = Link.find_by_short(params[:id])
      redirect_to @link.long
    else
      render :text => '404 Not found.', :status => 404 
    end
  end
    

  # GET /links/new
  # GET /links/new.xml
  def new
    @link = Link.new :long => 'http://'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @link }
    end
  end

  # POST /links
  # POST /links.xml
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        flash[:notice] = 'Link was successfully created.'
        format.html { redirect_to(@link) }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

end
