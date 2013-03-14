module CollectionsHelper

	def harvest_success(collection)
		klass = 'warning'
		harvest = collection.last_harvest
		if harvest and harvest.too_old?
			klass = harvest.success ? 'success' : 'error' 
		end
		return klass
	end

	def last_harvest(collection)
		harvest = collection.last_harvest
		if harvest
			if harvest.success
				display = time_ago_in_words(harvest.start) 
				display += harvest.too_old? ? harvest_duration(harvest) : ''
			else
				display = t('collection.failed')
			end
		else
			display = t('collection.none')
		end
		return display
	end

end
