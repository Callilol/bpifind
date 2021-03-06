class CreateCollections < ActiveRecord::Migration
  def change
		create_table :collections do |t|
			t.string 		:name,							:null => false
			t.string	 	:full_name,					:null => false
			t.string 		:connection_type
			t.string 		:host
			t.string	 	:user
			t.string 		:password
			t.string 		:record_schema
			t.string 		:definition
			t.boolean		:word
			t.string		:url

      t.timestamps
    end
  end
end
