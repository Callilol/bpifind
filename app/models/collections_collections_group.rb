class CollectionsCollectionsGroup < ActiveRecord::Base
  attr_accessible :collection_id, :collections_group_id
	validates_presence_of :collection_id, :collections_group_id
end
