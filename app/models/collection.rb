class Collection < ActiveRecord::Base
	attr_accessible :name, :full_name, :host, :user, :password
end
