class CreateHarvestSchedules < ActiveRecord::Migration
  def change
    create_table :harvest_schedules do |t|
			t.string		:name,							:null => false
			t.string	 	:harvest_day,	 			:null => false	
			t.time		 	:harvest_time,	 		:null => false	
			t.boolean		:partial, 					:null => false,		:default => true
			t.boolean 	:active, 						:default => false

      t.timestamps
    end
  end
end
