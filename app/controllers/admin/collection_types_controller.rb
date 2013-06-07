class Admin::CollectionTypesController < AdminController

	before_filter :find_collection_type, :only => [:show, :edit, :update, :destroy]

	def find_collection_type
		@collection_type = CollectionType.find(params[:id])
	end

  def index
    @objects = CollectionType.order(CollectionType.sort_column).page(params[:page])
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

end
