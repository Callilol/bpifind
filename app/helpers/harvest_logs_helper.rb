module HarvestLogsHelper

	def harvest_duration(harvest)
		Time.at(harvest.end - harvest.start).utc.strftime(' (%H heures et %M minutes) ')
	end

end
