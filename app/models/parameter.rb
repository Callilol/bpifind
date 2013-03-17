class Parameter < ActiveRecord::Base
  attr_accessible :name, :value, :description
	validates_presence_of :name, :value
end
