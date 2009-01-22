class RemoveExtraFieldsFromJoinTables < ActiveRecord::Migration
  def self.up
=begin
# This migration was causing problems in SQLite3 (it isn't very good at modifying table structures.)
# The workaround is to go back and fix migration 002, then just disable this migration.
# By disabling this migration, we're assuming that no one is currently inbetween schemas 002 and 005.
#  - if they're past 005, they won't notice any of this
#  - if they're prior to 002, they'll get the fixed 002 migration in the first place.
    remove_column :permissions_roles, :created_at
    remove_column :permissions_roles, :updated_at
    remove_column :roles_users, :created_at
    remove_column :roles_users, :updated_at
=end
  end

  def self.down
=begin
    add_column :permissions_roles, :created_at, :datetime
    add_column :permissions_roles, :updated_at, :datetime
    add_column :roles_users, :created_at, :datetime
    add_column :roles_users, :updated_at, :datetime
=end
  end
end
