class AddBirthdayToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :birth_day, :date
  end

  def self.down
    remove_column :users, :birth_day
  end
end
