class Admin::CollectionsController < AdminController

	before_filter :find_collection, :only => [:show, :edit, :update, :destroy]

	def find_collection
		@collection = Collection.find(params[:id])
	end

	def search
		q = "%#{params[:q].downcase}%"
		@collections = Collection.where('name LIKE ? OR full_name LIKE ?', q, q).page(params[:page])
		
   	@results = [] 
		@results = @collections.collect {|c| {:label => "#{c.full_name} (#{c.name})", :url => admin_collection_path(c)}}

    respond_to do |format|
			format.html { render :partial => "admin/collections/listing", :locals => { :collections => @collections }, :layout => false }
			format.json { render :json => @results }
    end
	end

  def index
    @collections = Collection.order(:full_name).page(params[:page])
  end

	def show
		@collections_groups = @collection.collections_groups
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
