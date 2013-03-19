class CollectionType < ActiveRecord::Base
  attr_accessible :name, :full_name, :description
	validates_presence_of :name, :full_name

	has_many :collections_groups
end
