module CollectionTypesHelper
	def types
		types = [[t('helpers.words.all'), 0]] + CollectionType.all.collect {|ct| [ct.full_name, ct.id]}
	end
end
