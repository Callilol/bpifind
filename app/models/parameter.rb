class Parameter < ActiveRecord::Base
  attr_accessible :name, :value, :description
	validates_presence_of :name, :value

	def label
		"#{name} (#{value})"
	end

	class << self
		def search(q)
			where('name LIKE ? OR value LIKE ? OR description LIKE ?', q, q, q)
		end
	end
end
