class Admin::CollectionsController < AdminController

	before_filter :find_collection, :only => [:show, :edit, :update, :destroy]

	def find_collection
		@collection = Collection.find(params[:id])
	end

	def by_harvest_status
		@collections = Kaminari.paginate_array(Collection.by_harvest_status(params[:q].to_s)).page(params[:page])
		render :partial => "admin/collections/listing", :locals => { :collections => @collections }, :layout => false 
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
		sort_column ||= 'full_name'
    @collections = Collection.order(sort_column + " " + sort_direction).page(params[:page])
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

	private
	def sort_column
		Collection.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
