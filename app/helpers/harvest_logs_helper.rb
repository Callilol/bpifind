module HarvestLogsHelper

	def harvest_duration(harvest)
		Time.at(harvest.end - harvest.start).utc.strftime(' (%H heures et %M minutes) ')
	end

	def harvest_success(harvest)
		klass = 'warning'
		if harvest and harvest.too_old?
			klass = harvest.success ? 'success' : 'error' 
		end
		return klass
	end

end
