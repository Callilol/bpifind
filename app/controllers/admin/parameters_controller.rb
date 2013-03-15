class Admin::ParametersController < AdminController
  def index
    @parameters = Parameter.all

    respond_to do |format|
      format.html 
      format.json { render json: @parameters }
    end
  end

  def new
    @parameter = Parameter.new

    respond_to do |format|
      format.html 
      format.json { render json: @parameter }
    end
  end

  def edit
    @parameter = Parameter.find(params[:id])
  end

  def create
    @parameter = Parameter.new(params[:parameter])

    respond_to do |format|
      if @parameter.save
        format.html { redirect_to admin_parameters_url, notice: t('parameter.created', :name => @parameter.name) }
        format.json { render json: @parameter, status: :created, location: @parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @parameter = Parameter.find(params[:id])

    respond_to do |format|
      if @parameter.update_attributes(params[:parameter])
        format.html { redirect_to admin_parameters_url, notice: t('parameter.updated', :name => @parameter.name) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @parameter.errors, status: :unprocessable_entity }
      end
    end
  end

end
