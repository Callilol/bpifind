class Admin::UsersController < AdminController

	before_filter :find_user, :only => [:show, :edit, :update, :destroy]

	def find_user
		@user = User.find(params[:id])
	end

	def search
		q = "%#{params[:q].downcase}%"
		@users = User.where('name LIKE ? OR email LIKE ?', q, q).page(params[:page])
		
   	@results = [] 
		@results = @users.collect {|c| {:label => "#{c.name} (#{c.email})", :url => admin_user_path(c)}}

    respond_to do |format|
			format.html { render :partial => "admin/users/listing", :locals => { :users => @users }, :layout => false }
			format.json { render :json => @results }
    end
	end

  def index
		sort_column ||= 'name'
    @users = User.order(sort_column + " " + sort_direction).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
		if @user.save
			redirect_to admin_user_path(@user), notice: t('user.created', :name => @user.name) 
		else
			render action: "new" 
		end
  end

  def update
		if @user.update_attributes(params[:user])
			redirect_to admin_user_path(@user), notice: t('user.updated', :name => @user.name) 
		else
			render action: "edit" 
		end
  end

  def destroy
		name = @user.name
    @user.destroy
    redirect_to admin_users_path, notice: t('user.destroyed', :name => name ) 
  end

	private
	def sort_column
		User.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
