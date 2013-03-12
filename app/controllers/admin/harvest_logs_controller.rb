class Admin::HarvestLogsController < AdminController
  def index
    @harvest_logs = HarvestLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @harvest_logs }
    end
  end

  def show
    @harvest_log = HarvestLog.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @harvest_log }
    end
  end

  def new
    @harvest_log = HarvestLog.new

    respond_to do |format|
      format.html 
      format.json { render json: @harvest_log }
    end
  end

  def edit
    @harvest_log = HarvestLog.find(params[:id])
  end

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

  def destroy
    @harvest_log = HarvestLog.find(params[:id])
    @harvest_log.destroy

    respond_to do |format|
      format.html { redirect_to harvest_logs_url }
      format.json { head :no_content }
    end
  end
end
