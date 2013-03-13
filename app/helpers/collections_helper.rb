module CollectionsHelper

	def success(collection)
		klass = 'warning'
		klass = collection.last_harvest.success ? 'success' : 'error' if collection.last_harvest
	end

	def harvest_duration(harvest)
		Time.at(harvest.end - harvest.start).utc.strftime(' (%H heures et %M minutes) ')
	end

	def formatted(harvest)
		if harvest.success
			display = time_ago_in_words(harvest.start) 
			display = harvest.full ? t('collection.full') : t('collection.partial')
			display += harvest_duration(harvest)
			display += time_ago_in_words(harvest.start)
		else
			display = t('collection.failed')
		end
	end

end
