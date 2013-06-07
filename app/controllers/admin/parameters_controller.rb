class Admin::ParametersController < AdminController
	
	before_filter :find_parameter, :only => [:show, :edit, :update]

	def find_parameter
    @parameter = Parameter.find(params[:id])
	end

  def index
    @objects = Parameter.order(Parameter.sort_column).page(params[:page])
  end

  def new
    @parameter = Parameter.new
  end

  def create
    @parameter = Parameter.new(params[:parameter])
		if @parameter.save
			redirect_to admin_parameters_url, notice: t('parameter.created', :name => @parameter.name) 
		else
			render action: "new" 
		end
  end

  def update
		if @parameter.update_attributes(params[:parameter])
			redirect_to admin_parameters_url, notice: t('parameter.updated', :name => @parameter.name) 
		else
			render action: "edit" 
		end
  end

end
