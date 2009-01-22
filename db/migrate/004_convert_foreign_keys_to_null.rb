class ConvertForeignKeysToNull < ActiveRecord::Migration
  def self.up
    remove_column :branches, :tree_id
    add_column :branches, :tree_id, :integer

    remove_column :rocks, :forest_id
    add_column :rocks, :forest_id, :integer

    remove_column :roots, :tree_id
    add_column :roots, :tree_id, :integer

    remove_column :trees, :forest_id
    add_column :trees, :forest_id, :integer

    remove_column :trunks, :tree_id
    add_column :trunks, :tree_id, :integer
  end

  def self.down
    remove_column :branches, :tree_id
    add_column :branches, :tree_id, :integer, :default => 0, :null => false

    remove_column :rocks, :forest_id
    add_column :rocks, :forest_id, :integer, :default => 0, :null => false

    remove_column :roots, :tree_id
    add_column :roots, :tree_id, :integer, :default => 0, :null => false

    remove_column :trees, :forest_id
    add_column :trees, :forest_id, :integer, :default => 0, :null => false

    remove_column :trunks, :tree_id
    add_column :trunks, :tree_id, :integer, :default => 0, :null => false
  end
end
