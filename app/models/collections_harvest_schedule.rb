class CollectionsCollectionsGroup < ActiveRecord::Base
  attr_accessible :collection_id, :harvest_schedule_id
	validates_presence_of :collection_id, :harvest_schedule_id
end
