class UploadsController < ApplicationController
  before_filter :authenticate_user!
  uses_tiny_mce :only => [:new, :create, :edit, :update]

  # GET /uploads
  # GET /uploads.xml
  def index
    if params[:keywords] and not params[:keywords][:taglist].empty?
      @uploads = Upload.searchByTags(params[:keywords][:taglist])
      if @uploads.empty?
        flash[:alert] = t('uploads.no_files_found')
      end
    else
      flash[:warning] = t('uploads.empty_search') if params[:keywords]
      @uploads = Upload.searchByTags(nil)
    end

    @paginated_uploads = Upload.paginate_array @uploads, params

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.xml
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.xml
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.xml
  def create
    @uploader = User.where(:email => current_user.email)
    if @uploader and params[:upload]
      @upload = Upload.new(params[:upload].merge({:user => @uploader.first}))

      respond_to do |format|
        if @upload.save
          format.html { redirect_to(@upload, :notice => 'Upload was successfully created.') }
          format.xml  { render :xml => @upload, :status => :created, :location => @upload }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @upload.errors, :status => :unprocessable_entity }
        end
      end
    else
      flash[:error] = t('uploads.user_not_found')
      format.html { render :action => "new" }
      format.xml  { render :xml => @upload.errors, :status => :unprocessable_entity }
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.xml
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to(@upload, :notice => 'Upload was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @upload.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.xml
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to(uploads_url) }
      format.xml  { head :ok }
    end
  end
end
