class CollectionsCollectionsGroups < ActiveRecord::Migration
  def change
		create_table :collections_collections_groups do |t|
			t.integer	:collection_id, 				:null => :false
			t.integer	:collections_group_id, 	:null => :false
		
      t.timestamps
    end
  end
end
