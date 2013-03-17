class Admin::HarvestLogsController < AdminController

	def search
		q = "%#{params[:q].downcase}%"
		collection_id = params[:nested]
		@harvest_logs = HarvestLog.where('collection_id = ? AND (start LIKE ? OR end LIKE ?)', collection_id, q, q).page(params[:page])
		
   	@results = [] 
		@results = @harvest_logs.collect {|hl| {:label => hl.start.strftime('%d/%m/%Y %H:%M'), :url => 'none'}}

    respond_to do |format|
			format.html { render :partial => "admin/harvest_logs/listing", :locals => { :harvest_logs => @harvest_logs }, :layout => false }
			format.json { render :json => @results }
    end
	end

	def by_state
		@collection = Collection.find(params[:collection_id]) 
		@harvest_logs = Kaminari.paginate_array(@collection.by_state(params[:q].to_s)).page(params[:page])
		render :partial => 'admin/harvest_logs/listing', :locals => { :harvest_logs => @harvest_logs }, :layout => false
	end

  def index
		sort_column ||= 'start'
		sort_direction ||= 'desc'
		@collection = Collection.find(params[:collection_id]) 
   	@harvest_logs = @collection.harvest_logs.order(sort_column + " " + sort_direction).page(params[:page])
  end

  def destroy
    @harvest_log = HarvestLog.find(params[:id])
		date = @harvest_log.start.strftime('%d/%m/%Y')
		@collection = @harvest_log.collection
    @harvest_log.destroy
    redirect_to admin_collection_harvest_logs_path(@collection), notice: t('harvest_log.destroyed', :name => date ) 
  end

	def destroy_all
		collection = Collection.find(params[:collection_id])
		collection.harvest_logs.delete_all
    redirect_to admin_collection_path(collection), notice: t('harvest_log.destroyed_all', :name => collection.full_name ) 
	end

	private
	def sort_column
		HarvestLog.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
