module ApplicationHelper

	def sortable(column, title = nil)
		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end

	def booleans
		[[t('helpers.words.all'), 'all'], [t('helpers.words.yeslabel'), 1], [t('helpers.words.nolabel'), 0]]
	end

end
