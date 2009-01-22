class AddTicksToBears < ActiveRecord::Migration
  def self.up
    add_column :bears, :ticks, :integer
  end

  def self.down
    remove_column :bears, :ticks
  end
end
