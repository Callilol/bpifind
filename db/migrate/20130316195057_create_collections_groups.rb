class CreateCollectionsGroups < ActiveRecord::Migration
  def change
    create_table :collections_groups do |t|
			t.string	:name,						:null => false
			t.string	:full_name,				:null => false
			t.text		:description
			t.boolean	:enabled,					:default => false
			t.integer	:collection_type_id

      t.timestamps
    end
  end
end
