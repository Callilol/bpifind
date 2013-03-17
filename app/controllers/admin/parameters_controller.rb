class Admin::ParametersController < AdminController
	
	before_filter :find_parameter, :only => [:show, :edit, :update]

	def find_parameter
    @parameter = Parameter.find(params[:id])
	end

	def search
		q = "%#{params[:q].downcase}%"
		@parameters = Parameter.where('name LIKE ? OR value LIKE ? OR description LIKE ?', q, q, q).page(params[:page])
		
   	@results = [] 
		@results = @parameters.collect {|p| {:label => "#{p.name} (#{p.value})", :url => admin_parameter_path(p)}}

    respond_to do |format|
			format.html { render :partial => "admin/parameters/listing", :locals => { :parameters => @parameters }, :layout => false }
			format.json { render :json => @results }
    end
	end

  def index
    @parameters = Parameter.order(:name).page(params[:page])
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
