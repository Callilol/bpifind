class Collection < ActiveRecord::Base
	attr_accessible :name, :full_name, :host, :user, :password, :connection_type, :record_schema, :definition, :word, :url
	has_many :harvest_logs
	validates_presence_of :name, :full_name, :host, :user, :password

	def last_harvest
		harvest_logs.order('start desc').first
	end

	class << self
		def list(q)
			where('name LIKE ? OR full_name LIKE ?', q, q)
		end
	end
end
