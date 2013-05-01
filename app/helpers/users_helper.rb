module UsersHelper
	def roles
		roles = [[t('helpers.words.all'), 0]] + User::ROLES.collect {|r| [r, r]}
	end
end
