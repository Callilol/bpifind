class HarvestLog < ActiveRecord::Base
	belongs_to :collection
	attr_accessible :collection_id, :start, :end, :success, :full, :nb

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
end
