class CollectionsGroup < ActiveRecord::Base
  attr_accessible :name, :full_name, :description, :enabled, :collection_type_id
	validates_presence_of :name, :full_name, :collection_type_id

	belongs_to :collection_type
	has_and_belongs_to_many :collections
end
