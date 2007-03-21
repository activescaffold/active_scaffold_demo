class CreateShores < ActiveRecord::Migration
  def self.up
    drop_table :forests_lakes
    create_table :shores do |t|
      t.column :forest_id, :integer
      t.column :lake_id, :integer
      t.column :name, :string
    end
  end

  def self.down
    drop_table :shores
    create_table :forests_lakes, :id => false do |t|
      t.column :forest_id, :integer
      t.column :lake_id, :integer
    end
  end
end
