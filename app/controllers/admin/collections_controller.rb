class Admin::CollectionsController < AdminController

	before_filter :find_collection, :only => [:show, :edit, :update, :destroy]

	def find_collection
		@collection = Collection.find(params[:id])
	end

	def search
		@collections = Collection.list("%#{params[:q].downcase}%").page(params[:page])
		
   	@results = [] 
		@results = @collections.collect {|c| "#{c.full_name} (#{c.name})"}

    respond_to do |format|
			format.html { render :partial => "admin/collections/listing", :locals => { :collections => @collections }, :layout => false }
			format.json { render :json => @results }
    end
	end

  def index
    @collections = Collection.order(:full_name).page(params[:page])
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(params[:collection])
		if @collection.save
			redirect_to admin_collection_path(@collection), notice: t('collection.created', :name => @collection.full_name) 
		else
			render action: "new" 
		end
  end

  def update
		if @collection.update_attributes(params[:collection])
			redirect_to admin_collection_path(@collection), notice: t('collection.updated', :name => @collection.name) 
		else
			render action: "edit" 
		end
  end

  def destroy
		name = @collection.full_name
    @collection.destroy
    redirect_to admin_collections_path, notice: t('collection.destroyed', :name => name ) 
  end
end
