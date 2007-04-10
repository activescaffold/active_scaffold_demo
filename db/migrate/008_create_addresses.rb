class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.column :city, :string
      t.column :state, :string
      t.column :zip, :integer
      t.column :addressable_id, :integer
      t.column :addressable_type, :string
    end
  end

  def self.down
    drop_table :addresses
  end
end
