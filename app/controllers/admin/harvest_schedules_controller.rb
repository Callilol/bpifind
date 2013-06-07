class Admin::HarvestSchedulesController < AdminController

	before_filter :find_harvest_schedule, :only => [:show, :edit, :update, :destroy]

	def find_harvest_schedule
		@harvest_schedule = HarvestSchedule.find(params[:id])
	end

  def index
    @harvest_schedules = HarvestSchedule.order(HarvestSchedule.sort_column).page(params[:page])
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

end
