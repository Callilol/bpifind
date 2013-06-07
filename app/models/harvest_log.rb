class HarvestLog < ActiveRecord::Base
	belongs_to :collection
	attr_accessible :collection_id, :start, :end, :success, :full, :nb

	def label
		start.strftime('%d/%m/%Y %H:%M')
	end

	def show_path
		"none"
	end

	def too_old?
		param = Parameter.find_by_name('harvest_days_limit')
		limit = param.nil? ? 15.days : param.value.to_i.days
		return start < Date.today - limit
	end

	def status
		case
			when success && !too_old? then '1'
			when !success then '2'
			when too_old? then '3'
		end
	end

	class << self
		def search(q, collection_id)
			Collection.find(collection_id).harvest_logs.where("start LIKE ? OR end LIKE ?", q, q)
		end

		def by_state(state, collection_id)
			c = Collection.find(collection_id)
			state == 'all' ? c.harvest_logs : c.harvest_logs.where(:full => state)
		end
	end

end
