class CreateLakes < ActiveRecord::Migration
  def self.up
    create_table :lakes do |t|
    end
  end

  def self.down
    drop_table :lakes
  end
end
