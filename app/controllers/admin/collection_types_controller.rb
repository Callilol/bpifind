class Admin::CollectionTypesController < AdminController

	before_filter :find_collection_type, :only => [:show, :edit, :update, :destroy]

	def find_collection_type
		@collection_type = CollectionType.find(params[:id])
	end

	def search
		q = "%#{params[:q].downcase}%"
		@collection_types = CollectionType.where('name LIKE ? OR full_name LIKE ?', q, q).page(params[:page])
		
   	@results = [] 
		@results = @collection_types.collect {|ct| {:label => "#{ct.full_name} (#{ct.name})", :url => admin_collection_type_path(ct)}}

    respond_to do |format|
			format.html { render :partial => "admin/collection_types/listing", :locals => { :collection_types => @collection_types }, :layout => false }
			format.json { render :json => @results }
    end
	end

  def index
		sort_column ||= 'full_name'
    @collection_types = CollectionType.order(sort_column + " " + sort_direction).page(params[:page])
  end

	def show
		@collections_groups = @collection_type.collections_groups
	end

  def new
    @collection_type = CollectionType.new
  end

  def create
    @collection_type = CollectionType.new(params[:collection_type])
		if @collection_type.save
			redirect_to admin_collection_type_path(@collection_type), notice: t('collection_type.created', :name => @collection_type.full_name) 
		else
			render action: "new" 
		end
  end

  def update
		if @collection_type.update_attributes(params[:collection_type])
			redirect_to admin_collection_type_path(@collection_type), notice: t('collection_type.updated', :name => @collection_type.name) 
		else
			render action: "edit" 
		end
  end

  def destroy
		name = @collection_type.full_name
    @collection_type.destroy
    redirect_to admin_collection_types_path, notice: t('collection_type.destroyed', :name => name ) 
  end

	private
	def sort_column
		CollectionType.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
