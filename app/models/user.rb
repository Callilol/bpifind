class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role

	ROLES = %w[administrateur biblio]

	class << self
		def by_role(role)
			role = User::ROLES unless role != '0'
			where('role in (?)', role)
		end
	end
end
