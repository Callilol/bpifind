class HarvestLog < ActiveRecord::Base
	belongs_to :collection
	attr_accessible :collection_id, :start, :end, :success, :full, :nb

	def too_old?
		param = Parameter.find_by_name('harvest_limit')
		limit = param.nil? ? 15.days : param.value.to_i.days
		return start > Date.today - limit
	end
end
