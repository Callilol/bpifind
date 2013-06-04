class HarvestSchedule < ActiveRecord::Base
  attr_accessible :name, :harvest_day, :harvest_time, :partial, :active, :collection_ids
	
	has_and_belongs_to_many :collections

	DAYS = %w[lundi mardi mercredi jeudi vendredi samedi dimanche]

	class << self
		def by_active(active)
			active = active == 'all' ? [0,1] : active
			where('active in (?)', active)
		end

		def by_partial(partial)
			partial = partial == 'all' ? [0,1] : partial
			where('partial in (?)', partial)
		end
	end

end
