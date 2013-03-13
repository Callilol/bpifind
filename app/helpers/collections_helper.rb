module CollectionsHelper

	def harvest_success(collection)
		klass = 'warning'
		klass = collection.last_harvest.success ? 'success' : 'error' if collection.last_harvest
	end

	def last_harvest(collection)
		harvest = collection.last_harvest
		if harvest
			if harvest.success
				display = time_ago_in_words(harvest.start) 
				display += harvest_duration(harvest)
			else
				display = t('collection.failed')
			end
		end
	end

end
