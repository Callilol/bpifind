class CollectionsGroup < ActiveRecord::Base
  attr_accessible :name, :full_name, :description, :enabled, :collection_type_id
	validates_presence_of :name, :full_name, :collection_type_id

	belongs_to :collection_type
	has_and_belongs_to_many :collections

	class << self

		def by_collection_type(type)
			type == '0' ? all : joins(:collection_type).where('collection_type_id' => type)
		end

		def by_activation(id)
			id = [0, 1] unless id != 'all'
			where('enabled in (?)', id)
		end
	end
end
