class CreateCollectionTypes < ActiveRecord::Migration
  def change
    create_table :collection_types do |t|
			t.string		:name,				:false => :null
			t.string		:full_name,		:false => :null
			t.string		:description

      t.timestamps
    end
  end
end
