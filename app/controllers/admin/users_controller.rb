class Admin::UsersController < AdminController

	before_filter :find_user, :only => [:show, :edit, :update, :destroy]

	def find_user
		@user = User.find(params[:id])
	end

  def index
    @objects = User.order(User.sort_column).page(params[:page])
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

end
