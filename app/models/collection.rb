class Collection < ActiveRecord::Base
	attr_accessible :name, :full_name, :host, :user, :password, :connection_type, :record_schema, :definition, :word, :url
	validates_presence_of :name, :full_name, :host, :user, :password

	has_many :harvest_logs
	has_and_belongs_to_many :collections_groups

	def last_harvest
		harvest_logs.order('start desc').first
	end
	
	def by_state(state)
		state == 'all' ? harvest_logs : harvest_logs.where(:full => state)
	end

	class << self
		def by_harvest_status(status)
			return case status
				when '0' then all
				when '4' then all.select {|c| c.harvest_logs.empty?}
				else all.select {|c| c.last_harvest.status.to_s == status.to_s if c.last_harvest}
			end
		end
	end

end
