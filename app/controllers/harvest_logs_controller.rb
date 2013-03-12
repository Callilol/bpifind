class HarvestLogsController < ApplicationController
  # GET /harvest_logs
  # GET /harvest_logs.json
  def index
    @harvest_logs = HarvestLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @harvest_logs }
    end
  end

  # GET /harvest_logs/1
  # GET /harvest_logs/1.json
  def show
    @harvest_log = HarvestLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @harvest_log }
    end
  end

  # GET /harvest_logs/new
  # GET /harvest_logs/new.json
  def new
    @harvest_log = HarvestLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @harvest_log }
    end
  end

  # GET /harvest_logs/1/edit
  def edit
    @harvest_log = HarvestLog.find(params[:id])
  end

  # POST /harvest_logs
  # POST /harvest_logs.json
  def create
    @harvest_log = HarvestLog.new(params[:harvest_log])

    respond_to do |format|
      if @harvest_log.save
        format.html { redirect_to @harvest_log, notice: 'Harvest log was successfully created.' }
        format.json { render json: @harvest_log, status: :created, location: @harvest_log }
      else
        format.html { render action: "new" }
        format.json { render json: @harvest_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /harvest_logs/1
  # PUT /harvest_logs/1.json
  def update
    @harvest_log = HarvestLog.find(params[:id])

    respond_to do |format|
      if @harvest_log.update_attributes(params[:harvest_log])
        format.html { redirect_to @harvest_log, notice: 'Harvest log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @harvest_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /harvest_logs/1
  # DELETE /harvest_logs/1.json
  def destroy
    @harvest_log = HarvestLog.find(params[:id])
    @harvest_log.destroy

    respond_to do |format|
      format.html { redirect_to harvest_logs_url }
      format.json { head :no_content }
    end
  end
end
