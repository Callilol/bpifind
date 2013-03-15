class Admin::HarvestLogsController < AdminController
  def index
		@collection = Collection.find(params[:collection_id]) 
   	@harvest_logs = @collection.harvest_logs.order('start desc').page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @harvest_logs }
    end
  end

  def destroy
    @harvest_log = HarvestLog.find(params[:id])
		date = @harvest_log.start.strftime('%d/%m/%Y')
		@collection = @harvest_log.collection
    @harvest_log.destroy

    respond_to do |format|
      format.html { redirect_to admin_collection_harvest_logs_path(@collection), notice: t('harvest_log.destroyed', :name => date ) }
      format.json { head :no_content }
    end
  end

	def destroy_all
		collection = Collection.find(params[:collection_id])
		collection.harvest_logs.delete_all
    respond_to do |format|
      format.html { redirect_to admin_collection_path(collection), notice: t('harvest_log.destroyed_all', :name => collection.full_name ) }
      format.json { head :no_content }
    end
	end
end
