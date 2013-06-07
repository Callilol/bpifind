module ActiveRecordExtension

  extend ActiveSupport::Concern

  def label
  	"#{full_name} (#{name})"
  end

  module ClassMethods
		def search(q)
			where('name LIKE ? OR full_name LIKE ?', q, q)
		end

		def sort_column
			column = self.column_names.include? 'full_name' ? 'full_name asc' : 'name asc'
			column
		end
  end

end
ActiveRecord::Base.send(:include, ActiveRecordExtension)
