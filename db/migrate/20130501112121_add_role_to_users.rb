class AddRoleToUsers < ActiveRecord::Migration
  def change
		add_column :users, :role, :string, :default => 'biblio'
  end
end
