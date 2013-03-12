module CollectionsHelper

	def last_harvest(collection)
		harvest = collection.harvest_logs.order('start desc').first	
	end

end
