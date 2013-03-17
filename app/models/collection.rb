class Collection < ActiveRecord::Base
	attr_accessible :name, :full_name, :host, :user, :password, :connection_type, :record_schema, :definition, :word, :url
	validates_presence_of :name, :full_name, :host, :user, :password

	has_many :harvest_logs
	has_and_belongs_to_many :collections_groups

	def last_harvest
		harvest_logs.order('start desc').first
	end
end
