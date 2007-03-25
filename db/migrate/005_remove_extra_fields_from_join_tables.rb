class RemoveExtraFieldsFromJoinTables < ActiveRecord::Migration
  def self.up
    remove_column :permissions_roles, :created_at
    remove_column :permissions_roles, :updated_at
    remove_column :roles_users, :created_at
    remove_column :roles_users, :updated_at
  end

  def self.down
    add_column :permissions_roles, :created_at, :datetime
    add_column :permissions_roles, :updated_at, :datetime
    add_column :roles_users, :created_at, :datetime
    add_column :roles_users, :updated_at, :datetime
  end
end
