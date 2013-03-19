class CreateHarvestLogs < ActiveRecord::Migration
  def change
    create_table :harvest_logs do |t|
			t.integer 	:collection_id,			:null => false
			t.datetime	:start
			t.datetime	:end
			t.boolean		:success
			t.boolean 	:full
			t.integer		:nb
      t.timestamps
    end
  end
end
