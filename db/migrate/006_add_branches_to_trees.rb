class AddBranchesToTrees < ActiveRecord::Migration
  def self.up
    add_column :trees, :num_branches, :integer
  end

  def self.down
    remove_column :trees, :num_branches
  end
end
