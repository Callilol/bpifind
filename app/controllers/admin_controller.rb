class AdminController < ApplicationController
	layout 'admin'
	before_filter :authenticate_user!
	helper_method :sort_column, :sort_direction
end
