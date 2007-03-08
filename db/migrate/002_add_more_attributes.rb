class AddMoreAttributes < ActiveRecord::Migration
  def self.up
    add_column :alphas, :meta_title, :string
    add_column :alphas, :meta_keyword, :string
  end

  def self.down
    remove_column :alphas, :meta_title
    remove_column :alphas, :meta_keyword
  end
end
