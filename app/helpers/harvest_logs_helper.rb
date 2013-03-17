module HarvestLogsHelper

	def harvest_duration(harvest)
		Time.at(harvest.end - harvest.start).utc.strftime(' (%H heures et %M minutes) ')
	end

	def harvest_success(harvest)
		klass = 'warning'
		if harvest and !harvest.too_old?
			klass = harvest.success ? 'success' : 'error' 
		end
		return klass
	end

	def statuses
		param = Parameter.find_by_name('harvest_days_limit')
		time = param ? param.value : 15
		return [[t('helpers.words.all'), 0], [t('harvest_log.successfull').html_safe, 1], [t('harvest_log.fail').html_safe, 2], [t('harvest_log.old', :time => time).html_safe, 3], [t('helpers.words.none').html_safe, 4]]
	end

	def states
		[[t('helpers.words.all'), 'all'], [t('harvest_log.full').html_safe, 1], [t('harvest_log.partial').html_safe, 0]]
	end

end
