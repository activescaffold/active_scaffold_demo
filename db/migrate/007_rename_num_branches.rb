class RenameNumBranches < ActiveRecord::Migration
  def self.up
    rename_column :trees, :num_branches, :num_leaves
  end

  def self.down
    rename_column :trees, :num_leaves, :num_branches
  end
end
