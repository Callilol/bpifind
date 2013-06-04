class Admin::CollectionsGroupsController < AdminController

	before_filter :find_collections_group, :only => [:show, :edit, :update, :destroy]

	def find_collections_group
		@collections_group = CollectionsGroup.find(params[:id])
	end
	
	def filter
		activation = params[:filters][:activation].to_s
		collection_type = params[:filters][:collection_type].to_s
		@collections_groups = CollectionsGroup.by_activation(activation).by_collection_type(collection_type)
		@collections_groups = Kaminari.paginate_array(@collections_groups).page(params[:page])
		render :partial => "admin/collections_groups/listing", :locals => { :collections_groups => @collections_groups }, :layout => false 
	end

	def search
		q = "%#{params[:q].downcase}%"
		@collections_groups = CollectionsGroup.where('name LIKE ? OR full_name LIKE ?', q, q).page(params[:page])
		
   	@results = [] 
		@results = @collections_groups.collect {|c| {:label => "#{c.full_name} (#{c.name})", :url => admin_collections_group_path(c)}}

    respond_to do |format|
			format.html { render :partial => "admin/collections_groups/listing", :locals => { :collections_groups => @collections_groups }, :layout => false }
			format.json { render :json => @results }
    end
	end

  def index
		sort_column ||= 'full_name'
    @collections_groups = CollectionsGroup.order(sort_column + " " + sort_direction).page(params[:page])
  end

	def show
		@collection_type = @collections_group.collection_type
		@collections = @collections_group.collections
	end

  def new
    @collections_group = CollectionsGroup.new
  end

  def create
    @collections_group = CollectionsGroup.new(params[:collections_group])
		if @collections_group.save
			redirect_to admin_collections_group_path(@collections_group), notice: t('collections_group.created', :name => @collections_group.full_name) 
		else
			render action: "new" 
		end
  end

  def update
		if @collections_group.update_attributes(params[:collections_group])
			redirect_to admin_collections_group_path(@collections_group), notice: t('collections_group.updated', :name => @collections_group.name) 
		else
			render action: "edit" 
		end
  end

  def destroy
		name = @collections_group.full_name
    @collections_group.destroy
    redirect_to admin_collections_groups_path, notice: t('collections_group.destroyed', :name => name ) 
  end

	private
	def sort_column
		CollectionsGroup.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
