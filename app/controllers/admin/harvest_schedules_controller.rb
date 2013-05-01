class Admin::HarvestSchedulesController < AdminController

	before_filter :find_harvest_schedule, :only => [:show, :edit, :update, :destroy]

	def find_harvest_schedule
		@harvest_schedule = HarvestSchedule.find(params[:id])
	end

	def filter
		active = params[:filters][:active]
		partial = params[:filters][:partial]
		@harvest_schedules = HarvestSchedule.by_active(active).by_partial(partial).page(params[:page])
		render :partial => "admin/harvest_schedules/listing", :locals => { :harvest_schedules => @harvest_schedules }, :layout => false
	end

	def search
		q = "%#{params[:q].downcase}%"
		@harvest_schedules = HarvestSchedule.where('name LIKE ? OR harvest_day LIKE ? or harvest_time like ?', q, q, q).page(params[:page])
		
   	@results = [] 
		@results = @harvest_schedules.collect {|hs| {:label => "#{hs.name} (#{hs.harvest_day})", :url => admin_harvest_schedule_path(hs)}}

    respond_to do |format|
			format.html { render :partial => "admin/harvest_schedules/listing", :locals => { :harvest_schedules => @harvest_schedules }, :layout => false }
			format.json { render :json => @results }
    end
	end

  def index
		sort_column ||= 'name'
    @harvest_schedules = HarvestSchedule.order(sort_column + " " + sort_direction).page(params[:page])
  end

  def new
    @harvest_schedule = HarvestSchedule.new
  end

  def create
    @harvest_schedule = HarvestSchedule.new(params[:harvest_schedule])
		if @harvest_schedule.save
			redirect_to admin_harvest_schedule_path(@harvest_schedule), notice: t('harvest_schedule.created', :name => @harvest_schedule.name) 
		else
			render action: "new" 
		end
  end

  def update
		if @harvest_schedule.update_attributes(params[:harvest_schedule])
			redirect_to admin_harvest_schedule_path(@harvest_schedule), notice: t('harvest_schedule.updated', :name => @harvest_schedule.name) 
		else
			render action: "edit" 
		end
  end

  def destroy
		name = @harvest_schedule.name
    @harvest_schedule.destroy
    redirect_to admin_harvest_schedules_path, notice: t('harvest_schedule.destroyed', :name => name ) 
  end

	private
	def sort_column
		HarvestSchedule.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
