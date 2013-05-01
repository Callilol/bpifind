class HarvestSchedulesController < ApplicationController
  # GET /harvest_schedules
  # GET /harvest_schedules.json
  def index
    @harvest_schedules = HarvestSchedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @harvest_schedules }
    end
  end

  # GET /harvest_schedules/1
  # GET /harvest_schedules/1.json
  def show
    @harvest_schedule = HarvestSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @harvest_schedule }
    end
  end

  # GET /harvest_schedules/new
  # GET /harvest_schedules/new.json
  def new
    @harvest_schedule = HarvestSchedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @harvest_schedule }
    end
  end

  # GET /harvest_schedules/1/edit
  def edit
    @harvest_schedule = HarvestSchedule.find(params[:id])
  end

  # POST /harvest_schedules
  # POST /harvest_schedules.json
  def create
    @harvest_schedule = HarvestSchedule.new(params[:harvest_schedule])

    respond_to do |format|
      if @harvest_schedule.save
        format.html { redirect_to @harvest_schedule, notice: 'Harvest schedule was successfully created.' }
        format.json { render json: @harvest_schedule, status: :created, location: @harvest_schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @harvest_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /harvest_schedules/1
  # PUT /harvest_schedules/1.json
  def update
    @harvest_schedule = HarvestSchedule.find(params[:id])

    respond_to do |format|
      if @harvest_schedule.update_attributes(params[:harvest_schedule])
        format.html { redirect_to @harvest_schedule, notice: 'Harvest schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @harvest_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /harvest_schedules/1
  # DELETE /harvest_schedules/1.json
  def destroy
    @harvest_schedule = HarvestSchedule.find(params[:id])
    @harvest_schedule.destroy

    respond_to do |format|
      format.html { redirect_to harvest_schedules_url }
      format.json { head :no_content }
    end
  end
end
