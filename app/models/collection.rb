class Collection < ActiveRecord::Base
	attr_accessible :name, :full_name, :host, :user, :password
	has_many :harvest_logs
end
