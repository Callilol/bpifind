class CreateCollectionsHarvestSchedules < ActiveRecord::Migration
  def change
		create_table :collections_harvest_schedules do |t|
			t.integer	:collection_id, 				:null => :false
			t.integer	:harvest_schedule_id, 	:null => :false
		
      t.timestamps
    end
  end
end
