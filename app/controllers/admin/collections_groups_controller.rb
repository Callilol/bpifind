class Admin::CollectionsGroupsController < AdminController

	before_filter :find_collections_group, :only => [:show, :edit, :update, :destroy]

	def find_collections_group
		@collections_group = CollectionsGroup.find(params[:id])
	end
	
  def index
    @objects = CollectionsGroup.order(CollectionsGroup.sort_column).page(params[:page])
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

end
