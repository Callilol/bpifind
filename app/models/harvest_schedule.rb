class HarvestSchedule < ActiveRecord::Base
  attr_accessible :name, :harvest_day, :harvest_time, :partial, :active, :collection_ids
	
	has_and_belongs_to_many :collections

	DAYS = %w[lundi mardi mercredi jeudi vendredi samedi dimanche]

	def label
		"#{name} (#{harvest_day})"
	end

	class << self
		def by_active(active)
			active = active == 'all' ? [0,1] : active
			where('active in (?)', active)
		end

		def by_partial(partial)
			partial = partial == 'all' ? [0,1] : partial
			where('partial in (?)', partial)
		end

		def search(q, nested_id)
			where('name LIKE ? OR harvest_day LIKE ? or harvest_time like ?', q, q, q)
		end
	end

end
